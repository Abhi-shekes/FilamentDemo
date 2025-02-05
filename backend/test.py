import cv2
import torch

# Load the YOLOv5n model
model = torch.hub.load('ultralytics/yolov5', 'yolov5n')

# Open the video file
video_path = '/home/filamentai/Downloads/videoplayback.mp4'  # Replace with your video file path
cap = cv2.VideoCapture(video_path)

# Check if the video opened successfully
if not cap.isOpened():
    print("Error: Could not open video.")
    exit()

# Loop through the frames of the video
while cap.isOpened():
    ret, frame = cap.read()
    
    if not ret:
        break  # End of video
    
    # Perform inference on the current frame
    results = model(frame)
    
    # Render results on the frame
    results.render()  # This will draw the bounding boxes and labels
    
    # Display the frame with detections
    cv2.imshow('YOLOv5n Object Detection', frame)
    
    # Wait for the user to press 'q' to quit
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the video capture object and close any open windows
cap.release()
cv2.destroyAllWindows()
