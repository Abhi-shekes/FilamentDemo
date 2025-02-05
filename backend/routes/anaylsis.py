# backend/routes/analysis.py
import cv2
import torch
from fastapi import APIRouter, WebSocket
from io import BytesIO

router = APIRouter()

model = torch.hub.load("ultralytics/yolov5", "yolov5n")

@router.websocket("/ws/video")
async def video_analysis(websocket: WebSocket):
    await websocket.accept()
    cap = cv2.VideoCapture("/home/filamentai/Downloads/videoplayback.mp4") 

    while True:
        ret, frame = cap.read()
        if not ret:
            break

        with torch.amp.autocast('cuda'):
            results = model(frame)

        img = results.render()[0]

        _, img_encoded = cv2.imencode(".jpg", img)
        img_bytes = img_encoded.tobytes()

        await websocket.send_bytes(img_bytes)

    cap.release()
