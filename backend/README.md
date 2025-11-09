# FastAPI Backend for VOXFUTURE

This is the FastAPI backend for the VOXFUTURE Flutter application.

## Features

- RESTful API endpoints
- Firebase Admin SDK integration
- User management
- CORS enabled for Flutter app
- Health check endpoint

## Installation

1. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Configure environment variables:
```bash
cp .env.example .env
# Edit .env with your Firebase credentials
```

## Running the Server

Development mode:
```bash
uvicorn main:app --reload
```

Production mode:
```bash
uvicorn main:app --host 0.0.0.0 --port 8000
```

## API Documentation

Once the server is running, visit:
- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## Available Endpoints

### Health Check
- `GET /api/health` - Check API status

### Users
- `GET /api/users` - Get all users
- `GET /api/users/{user_id}` - Get specific user
- `POST /api/users` - Create new user
- `PUT /api/users/{user_id}` - Update user
- `DELETE /api/users/{user_id}` - Delete user

## Testing

```bash
pytest
```

## Docker Support (Optional)

Create a Dockerfile:
```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

Build and run:
```bash
docker build -t voxfuture-backend .
docker run -p 8000:8000 voxfuture-backend
```
