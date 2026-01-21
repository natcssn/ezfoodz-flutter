from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from login import router as login_router
from register import router as register_router
from otp import router as otp_router
from users import router as users_router
from sessions import router as session_router
from upload import router as upload_router

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(register_router)
app.include_router(login_router)
app.include_router(otp_router)
app.include_router(upload_router)
app.include_router(users_router)
app.include_router(session_router)

@app.get("/")
def root():
    return {"status": "EZFOODZ backend running"}
