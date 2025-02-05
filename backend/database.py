# backend/database.py
from motor.motor_asyncio import AsyncIOMotorClient
from pydantic import BaseSettings

class Settings(BaseSettings):
    MONGO_URI: str = "mongodb://localhost:27017"
    DATABASE_NAME: str = "video_analytics"

settings = Settings()

client = AsyncIOMotorClient(settings.MONGO_URI)
db = client[settings.DATABASE_NAME]
