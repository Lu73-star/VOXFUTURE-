from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    PROJECT_NAME: str = "VOXFUTURE"
    VERSION: str = "1.0.0"
    API_V1_STR: str = "/api"
    
    # Firebase configuration
    FIREBASE_PROJECT_ID: str = ""
    FIREBASE_PRIVATE_KEY: str = ""
    FIREBASE_CLIENT_EMAIL: str = ""
    
    class Config:
        env_file = ".env"
        case_sensitive = True

settings = Settings()
