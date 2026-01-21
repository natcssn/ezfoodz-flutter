from fastapi import APIRouter, Form, HTTPException
from Databases.db import get_conn

router = APIRouter()

@router.post("/verify-otp")
def verify(email: str = Form(...), otp: str = Form(...)):
    conn = get_conn("sessions.db")
    c = conn.cursor()

    c.execute("SELECT otp FROM pending WHERE email=?", (email,))
    row = c.fetchone()

    if not row or row[0] != otp:
        conn.close()
        raise HTTPException(status_code=400, detail="Invalid OTP")

    c.execute("UPDATE pending SET verified=1 WHERE email=?", (email,))
    conn.commit()
    conn.close()

    return {"verified": True}
