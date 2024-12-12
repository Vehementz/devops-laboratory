python3 -m venv .venv
source .venv/bin/activate
pip install fastapi uvicorn

python -c "import fastapi, uvicorn; print('Installation réussie !')"

uvicorn app.main:app --reload

<!-- python3 -m venv .venv
source .venv/bin/activate
pip install fastapi uvicorn pydantic -->
<!-- pip install "fastapi[standard]" pydantic -->
<!-- pip install starlette
<!-- You'll also want to install an ASGI server, such as uvicorn, daphne, or hypercorn. -->
pip install uvicorn -->


<!-- When you install with pip install "fastapi[standard]" it comes with some default optional standard dependencies.
If you don't want to have those optional dependencies, you can instead install pip install fastapi. -->

```
fastapi dev main.py
```

```
uvicorn app.main:app --reload
```