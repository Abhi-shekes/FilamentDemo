from fastapi import APIRouter, HTTPException
from backend.models import UserModel, UserInDB
from backend.database import db
from backend.auth import hash_password, verify_password, create_access_token
from motor.motor_asyncio import AsyncIOMotorCollection
from pydantic import BaseModel
from datetime import timedelta

router = APIRouter()

class LoginRequest(BaseModel):
    email: str
    password: str

# Signup route
@router.post("/signup")
async def signup(user: UserModel):
    users: AsyncIOMotorCollection = db["users"]
    existing_user = await users.find_one({"email": user.email})

    if existing_user:
        raise HTTPException(status_code=400, detail="Email already registered")
    
    hashed_password = hash_password(user.password)

    user_in_db = UserInDB(
        name=user.name,
        company=user.company,
        email=user.email,
        password=hashed_password  
    )

    await users.insert_one(user_in_db.dict())

    return {"message": "User registered successfully"}

# Login route
@router.post("/login")
async def login(login_request: LoginRequest):
    users: AsyncIOMotorCollection = db["users"]
    user = await users.find_one({"email": login_request.email})

    if not user or not verify_password(login_request.password, user["password"]):
        raise HTTPException(status_code=401, detail="Invalid credentials")

    access_token = create_access_token(data={"sub": user["email"]}, expires_delta=timedelta(minutes=30))
    return {"access_token": access_token, "token_type": "bearer"}
