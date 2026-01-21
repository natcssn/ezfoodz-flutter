from fastapi import APIRouter, Form
import random
from Databases.db import get_conn

router = APIRouter()

@router.post("/start-signup")
def start_signup(email: str = Form(...)):
    conn = get_conn("sessions.db")
    c = conn.cursor()

    c.execute("""
    CREATE TABLE IF NOT EXISTS pending(
        email TEXT,
        otp TEXT,
        verified INTEGER DEFAULT 0
    )
    """)

    otp = str(random.randint(1000, 9999))
    c.execute("INSERT INTO pending VALUES (?,?,0)", (email, otp))

    conn.commit()
    conn.close()

    print("OTP (DEV):", otp)
    return {"message": "OTP sent"}
