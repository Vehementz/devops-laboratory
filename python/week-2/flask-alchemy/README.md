python3 -m venv .venv # create an environnement
. .venv/bin/activate  # activate the environnement
pip install flask flask-sqlalchemy 

### Créer la base de données :
### Flask-SQLAlchemy fournit des commandes pour initialiser la base. Dans une session Python :

```
python3
>>> from app import db
>>> db.create_all()
```

