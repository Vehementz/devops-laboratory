# In main.py
from fastapi import FastAPI
from routes import items

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Bienvenue sur FastAPI !"}

# from fastapi import FastAPI
# from app.routes import items

# app = FastAPI()

# @app.get("/")
# def read_root():
#     return {"message": "Bienvenue sur FastAPI !"}

# from fastapi import FastAPI
# from app.routes import items

# app = FastAPI()
# @app.get("/")
# def read_root():
#     return {"message": "Bienvenue sur FastAPI !"}

# from fastapi import FastAPI
# from pydantic import BaseModel

# app = FastAPI()

# class Item(BaseModel):
#     name: str
#     price: float
#     description: str = None

# @app.post("/items/")
# def create_item(item: Item):
#     return {"message": f"Item '{item.name}' ajouté avec succès", "price": item.price}


# app = FastAPI(
#     title="API de gestion d'items",
#     description="Une API simple pour gérer des items avec FastAPI.",
#     version="1.0.0",
# )