import sqlite3

def get_conn(db_name):
    conn = sqlite3.connect(
        f"Databases/{db_name}",
        timeout=30,
        check_same_thread=False
    )
    conn.execute("PRAGMA journal_mode=WAL;")
    return conn
