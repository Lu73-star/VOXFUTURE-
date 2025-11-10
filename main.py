from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

app = FastAPI(title="VoxFuture AURYN API", version="1.0.0")

# 🔄 CORS: permite conexão com o Flutter (frontend)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 📦 Modelo de exemplo (entrada de texto)
class Message(BaseModel):
    text: str

# 🧠 Rota principal de teste
@app.get("/")
def read_root():
    return {"message": "🌌 AURYN API ativa e pulsando."}

# 🤖 Rota de processamento básico
@app.post("/analyze")
def analyze(msg: Message):
    text = msg.text.lower()
    mood = "positivo" if "amor" in text or "luz" in text else "neutro"
    return {"análise": f"Mensagem recebida: '{msg.text}'", "estado_detectado": mood}

# 🔧 Inicialização
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=5000)
