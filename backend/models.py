# backend/models.py

from pydantic import BaseModel, EmailStr

class UserModel(BaseModel):
    name: str
    company: str
    email: EmailStr
    password: str  


class UserInDB(UserModel):
    password: str  
    
