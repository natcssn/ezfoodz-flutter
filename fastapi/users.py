from fastapi import APIRouter, Form
from Databases.db import get_conn
from Databases.hashing import hash_password

router = APIRouter()

@router.post("/create-account")
def create_account(
    email: str = Form(...),
    username: str = Form(...),
    password: str = Form(...),
    address: str = Form("")
):
    conn = get_conn("users.db")
    c = conn.cursor()

    c.execute("""
    CREATE TABLE IF NOT EXISTS users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT,
        username TEXT,
        password TEXT,
        address TEXT
    )
    """)

    c.execute(
        "INSERT INTO users(email, username, password, address) VALUES (?,?,?,?)",
        (email, username, hash_password(password), address)
    )

    conn.commit()
    conn.close()
    return {"status": "account_created"}
