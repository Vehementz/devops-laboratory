from fastapi import APIRouter

router = APIRouter()

@router.get("/")
def get_items():
    return [{"item_id": 1, "name": "Item One"}, {"item_id": 2, "name": "Item Two"}]

@router.get("/{item_id}")
def get_item(item_id: int):
    return {"item_id": item_id, "name": f"Item {item_id}"}

    
# @router.post("/tasks/")  
# def create_task(task: Task):  
#     tasks.append(task)  
#     return {"message": "Tâche ajoutée avec succès", "task": task}  

