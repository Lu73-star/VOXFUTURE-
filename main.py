from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="VoxFuture API", version="1.0")

# Modelo de exemplo
class Message(BaseModel):
    text: str

# Rota principal
@app.get("/")
def read_root():
    return {"message": "🚀 VoxFuture API ativa e funcionando!"}

# Rota de análise de texto
@app.post("/analyze")
def analyze(msg: Message):
    text = msg.text.lower()
    mood = "positivo" if "amor" in text else "neutro"
    return {"análise": f"Mensagem recebida: {text}", "humor_detectado": mood}

# Inicialização
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=5000)
