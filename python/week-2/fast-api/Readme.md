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

<!-- When you install with pip install "fastapi[standard]" it comes with some default optional standard dependencies.
If you don't want to have those optional dependencies, you can instead install pip install fastapi. -->

```
fastapi dev main.py
```

```
uvicorn app.main:app --reload
```