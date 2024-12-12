# In main.py
from fastapi import FastAPI
from routes import items

app = FastAPI(
    title="API de gestion d'items",
    description="Une API simple pour gérer des items avec FastAPI.",
    version="1.0.0",
)
app.include_router(items.router, prefix="/items", tags=["items"]) # 

@app.get("/")
def read_root():
    return {"message": "Bienvenue sur FastAPI !"}


