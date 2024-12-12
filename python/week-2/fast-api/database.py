from typing import List
from .schemas import Task

# Simule une "base de données" en mémoire
FAKE_DB: List[Task] = [
    Task(id=1, title="Tâche initiale", description="Ceci est un exemple", completed=False),
]
