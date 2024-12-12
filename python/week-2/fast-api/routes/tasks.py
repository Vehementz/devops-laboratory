from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from typing import List, Optional

router = APIRouter()

class TaskBase(BaseModel):
    title: str
    description: Optional[str] = None
    completed: bool = False

class TaskCreate(TaskBase):
    pass

class Task(TaskBase):
    id: int

# In-memory "database"
fake_db: List[Task] = [
    Task(id=1, title="Learn FastAPI", description="Read the docs", completed=False),
]

@router.get("/", response_model=List[Task])
def get_tasks():
    """Return all tasks."""
    return fake_db

@router.get("/{task_id}", response_model=Task)
def get_task(task_id: int):
    """Return a single task by its ID."""
    for task in fake_db:
        if task.id == task_id:
            return task
    raise HTTPException(status_code=404, detail="Task not found")

@router.post("/", response_model=Task, status_code=201)
def create_task(task: TaskCreate):
    """Create a new task with a unique ID."""
    new_id = max([t.id for t in fake_db], default=0) + 1
    new_task = Task(id=new_id, **task.dict())
    fake_db.append(new_task)
    return new_task

@router.delete("/{task_id}", status_code=204)

def delete_task(task_id: int):
    """Delete a task by its ID."""
    for i, t in enumerate(fake_db):
        if t.id == task_id:
            del fake_db[i]
            return
    raise HTTPException(status_code=404, detail="Task not found")


@router.put("/{task_id}", response_model=Task)
def update_task(task_id: int, task_update: TaskUpdate):
    """
    Update an existing task.
    This will overwrite the fields provided.
    Fields not provided remain the same.
    """
    for i, existing_task in enumerate(fake_db):
        if existing_task.id == task_id:
            # Convert existing task to a dict
            task_data = existing_task.dict()
            # Update only fields that are provided in the request
            update_data = task_update.dict(exclude_unset=True)
            for key, value in update_data.items():
                task_data[key] = value
            updated_task = Task(**task_data)
            fake_db[i] = updated_task
            return updated_task
    raise HTTPException(status_code=404, detail="Task not found")