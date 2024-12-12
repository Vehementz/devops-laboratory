from pydantic import BaseModel  

class Task(BaseModel):  
    id: int  
    title: str  
    description: str = None  
    completed: bool = False  



# from pydantic import BaseModel
# from typing import Optional

# class TaskBase(BaseModel):
#     title: str
#     description: Optional[str] = None
#     completed: bool = False

# class TaskCreate(TaskBase):
#     pass

# class TaskUpdate(TaskBase):
#     title: Optional[str]
#     description: Optional[str]
#     completed: Optional[bool]

# class Task(TaskBase):
#     id: int
#     class Config:
#         orm_mode = True
