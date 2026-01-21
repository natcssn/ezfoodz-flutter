from fastapi import APIRouter, Form, HTTPException
from Databases.db import get_conn
from Databases.hashing import verify_password

router = APIRouter()

@router.post("/login")
def login(username: str = Form(...), password: str = Form(...)):
    conn = get_conn("users.db")
    c = conn.cursor()

    c.execute("SELECT password FROM users WHERE username=?", (username,))
    row = c.fetchone()
    conn.close()

    if not row or not verify_password(password, row[0]):
        raise HTTPException(status_code=401, detail="Invalid login")

    return {"login": "success"}
