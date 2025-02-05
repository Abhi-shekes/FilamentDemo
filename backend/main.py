# backend/main.py
from fastapi import FastAPI
from backend.routes import auth
from backend.routes import anaylsis

app = FastAPI()

app.include_router(auth.router)
app.include_router(anaylsis.router) 
