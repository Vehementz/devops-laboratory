python3 -m venv .venv
source .venv/bin/activate
pip install fastapi uvicorn

python -c "import fastapi, uvicorn; print('Installation réussie !')"

uvicorn app.main:app --reload


### Test the app

- Create a tasks

```
curl -X POST http://127.0.0.1:8000/tasks/ \
    -H "Content-Type: application/json" \
    -d '{"title":"Write documentation","description":"Document the API","completed":false}'
```

- Delete a tasks

```
curl -X DELETE http://127.0.0.1:8000/tasks/<id>
```

Example :
```
curl -X DELETE http://127.0.0.1:8000/tasks/1
```

- Update a task

```
curl -X PUT http://127.0.0.1:8000/tasks/2 \
    -H "Content-Type: application/json" \
    -d '{"description": "Updated description", "completed": true}'
```


```
fastapi dev main.py
```

```
uvicorn main:app --reload
```

<!-- uvicorn app.main:app --reload -->
