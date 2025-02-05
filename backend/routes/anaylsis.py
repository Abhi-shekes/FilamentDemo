from fastapi import APIRouter, Request
from pydantic import BaseModel
import json

router = APIRouter()

class AnalysisRequest(BaseModel):
    source: str
    detectionType: str
    alertSMS: str = None  # Optional
    alertEmail: str = None  # Optional

@router.post("/start")
async def start_analysis(request: Request):
    data = await request.body()
    
    request_data = json.loads(data)
    
    print("Received request data:")
    print(json.dumps(request_data, indent=4))
    
    return {"status": "Data received", "data": request_data}
