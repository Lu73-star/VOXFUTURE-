from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from typing import List

router = APIRouter()

# Pydantic models
class User(BaseModel):
    id: str
    email: str
    displayName: str | None = None

class UserCreate(BaseModel):
    email: str
    password: str
    displayName: str | None = None

# In-memory storage (replace with database in production)
users_db = {}

@router.get("/", response_model=List[User])
async def get_users():
    """Get all users"""
    return list(users_db.values())

@router.get("/{user_id}", response_model=User)
async def get_user(user_id: str):
    """Get a specific user"""
    if user_id not in users_db:
        raise HTTPException(status_code=404, detail="User not found")
    return users_db[user_id]

@router.post("/", response_model=User)
async def create_user(user: UserCreate):
    """Create a new user"""
    # In production, hash the password and store in database
    user_id = f"user_{len(users_db) + 1}"
    new_user = User(
        id=user_id,
        email=user.email,
        displayName=user.displayName
    )
    users_db[user_id] = new_user
    return new_user

@router.put("/{user_id}", response_model=User)
async def update_user(user_id: str, user: UserCreate):
    """Update a user"""
    if user_id not in users_db:
        raise HTTPException(status_code=404, detail="User not found")
    
    updated_user = User(
        id=user_id,
        email=user.email,
        displayName=user.displayName
    )
    users_db[user_id] = updated_user
    return updated_user

@router.delete("/{user_id}")
async def delete_user(user_id: str):
    """Delete a user"""
    if user_id not in users_db:
        raise HTTPException(status_code=404, detail="User not found")
    
    del users_db[user_id]
    return {"message": "User deleted successfully"}
