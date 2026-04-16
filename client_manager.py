import psycopg2


def create_db(conn):
    """ Создание структуры БД, таблицы"""
    with conn.cursor() as cur:
        cur.execute("""
        CREATE TABLE IF NOT EXISTS client (
        client_id SERIAL PRIMARY KEY,
        first_name VARCHAR(100) NOT NULL,
        last_name VARCHAR(100) NOT NULL,
        email VARCHAR(255)
        );
            """)

        cur.execute("""
        CREATE TABLE IF NOT EXISTS phone (
        phone_number VARCHAR(20) PRIMARY KEY,
        client_id INTEGER NOT NULL REFERENCES client(client_id) ON DELETE CASCADE
        );
            """)

def add_client(conn, first_name, last_name, email, phones=None):
    """ Добавление нового клиента"""
    with conn.cursor() as cur:
        cur.execute("""
        INSERT INTO client (first_name, last_name, email) VALUES
        ('Иван', 'Петров', 'ivan@example.com'
        );
            """)


def add_client(conn, first_name, last_name, email, phones=None):
    """ Добавление нового клиента"""
    with conn.cursor() as cur:
        # Вставляем клиента
        cur.execute("""
            INSERT INTO client (first_name, last_name, email) 
            VALUES (%s, %s, %s);
        """, (first_name, last_name, email))

def add_phone(conn, phone, client_id):
    """ Добавление телефона по id клиента"""
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO phone (phone_number, client_id) 
            VALUES (%s, %s);
        """, (phone, client_id))

def change_client(conn, client_id, first_name=None, last_name=None, email=None, phones=None):
    """ Изменение информации по id клиента"""
    with conn.cursor() as cur:
        # Формируем список полей для обновления
        updates = []
        params = []

        if first_name is not None:
            updates.append("first_name = %s")
            params.append(first_name)

        if last_name is not None:
            updates.append("last_name = %s")
            params.append(last_name)

        if email is not None:
            updates.append("email = %s")
            params.append(email)

        # Если есть поля для обновления в таблице client
        if updates:
            params.append(client_id)
            cur.execute(f"""
                UPDATE client 
                SET {', '.join(updates)}
                WHERE client_id = %s;
            """, params)

        # Обновление телефонов
        if phones is not None:
            # Удаляем старые телефоны клиента
            cur.execute("""
                DELETE FROM phone 
                WHERE client_id = %s;
            """, (client_id,))

            # Добавляем новые телефоны
            for phone in phones:
                cur.execute("""
                    INSERT INTO phone (phone_number, client_id) 
                    VALUES (%s, %s);
                """, (phone, client_id))

def delete_phone(conn, client_id, phone):
    """ Удаление телефона у существующего клиента """
    with conn.cursor() as cur:
        cur.execute("""
            DELETE FROM phone 
            WHERE client_id = %s AND phone_number = %s;
        """, (client_id, phone))


def delete_client(conn, client_id):
    """ Удаление существующего клиента """
    with conn.cursor() as cur:
        # Проверяем, существует ли клиент
        cur.execute("SELECT client_id FROM client WHERE client_id = %s;", (client_id,))
        if not cur.fetchone():
            return 0  # Клиент не найден

        # Удаляем клиента (телефоны удалятся автоматически благодаря ON DELETE CASCADE)
        cur.execute("""
            DELETE FROM client 
            WHERE client_id = %s;
        """, (client_id,))


def find_client(conn, first_name=None, last_name=None, email=None, phone=None):
    """ Поиск клиента по его данным: имени, фамилии, email или телефону """
    with conn.cursor() as cur:
        # Формируем условия поиска
        conditions = []
        params = []

        if first_name is not None:
            conditions.append("c.first_name = %s")
            params.append(first_name)

        if last_name is not None:
            conditions.append("c.last_name = %s")
            params.append(last_name)

        if email is not None:
            conditions.append("c.email = %s")
            params.append(email)

        if phone is not None:
            conditions.append("p.phone_number = %s")
            params.append(phone)

        # Если нет ни одного условия, возвращаем всех клиентов (или пустой список)
        where_clause = " AND ".join(conditions) if conditions else "1=1"

        query = f"""
            SELECT DISTINCT 
                c.client_id, 
                c.first_name, 
                c.last_name, 
                c.email,
                STRING_AGG(p.phone_number, ', ') AS phones
            FROM client c
            LEFT JOIN phone p ON c.client_id = p.client_id
            WHERE {where_clause}
            GROUP BY c.client_id, c.first_name, c.last_name, c.email
            ORDER BY c.client_id;
        """

        cur.execute(query, params)

        results = cur.fetchall()

        # Преобразуем результат в список словарей для удобства
        clients = []
        for row in results:
            clients.append({
                'client_id': row[0],
                'first_name': row[1],
                'last_name': row[2],
                'email': row[3],
                'phones': row[4].split(', ') if row[4] else []
            })

        return clients

with psycopg2.connect(database='client_db', user='postgres', password='dbpass') as conn:
    create_db(conn)
    add_client(conn, 'Елена', 'Попова', 'elena@example.com')
    add_phone(conn, '+7 (999) 111-22-33', 4)
    # Изменить только имя
    change_client(conn, client_id=1, first_name='Сергей', last_name='Иванов')

    # Изменить всё и обновить телефоны
    change_client(
        conn,
        client_id=1,
        first_name='Петр',
        last_name='Смирнов',
        email='petr@example.com',
        phones=['+7 (999) 111-22-33', '+7 (999) 444-55-66']
    )
    delete_phone(conn, client_id=1, phone='+7 (999) 111-22-33')
    delete_client(conn, client_id=2)
    found = find_client(conn, phone='+7 (999) 111-22-33')
    conn.commit()
conn.close()