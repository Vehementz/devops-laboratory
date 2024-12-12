from fastapi import FastAPI
from routes import tasks

app = FastAPI(
    title="API de gestion de tâches",
    description="Une API simple pour gérer des tâches avec FastAPI.",
    version="1.0.0",
)

app.include_router(tasks.router, prefix="/tasks", tags=["tasks"])

@app.get("/")
def read_root():
    return {"message": "Bienvenue sur l'API de gestion des tâches !"}
