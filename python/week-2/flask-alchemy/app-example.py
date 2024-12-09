from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///app.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class Task(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    completed = db.Column(db.Boolean, default=False)

# Initialisation de la base de données
@app.before_first_request
def create_tables():
    db.create_all()

# Ajouter une tâche
@app.route('/add', methods=['POST'])
def add_task():
    data = request.json
    new_task = Task(title=data['title'])
    db.session.add(new_task)
    db.session.commit()
    return jsonify({"message": "Tâche ajoutée"}), 201

# Obtenir toutes les tâches
@app.route('/tasks', methods=['GET'])
def get_tasks():
    tasks = Task.query.all()
    return jsonify([{ "id": task.id, "title": task.title, "completed": task.completed } for task in tasks])

# Compléter une tâche
@app.route('/complete/<int:task_id>', methods=['PUT'])
def complete_task(task_id):
    task = Task.query.get(task_id)
    if task:
        task.completed = True
        db.session.commit()
        return jsonify({"message": f"Tâche {task_id} complétée"})
    return jsonify({"error": "Tâche introuvable"}), 404

# Supprimer une tâche
@app.route('/delete/<int:task_id>', methods=['DELETE'])
def delete_task(task_id):
    task = Task.query.get(task_id)
    if task:
        db.session.delete(task)
        db.session.commit()
        return jsonify({"message": f"Tâche {task_id} supprimée"})
    return jsonify({"error": "Tâche introuvable"}), 404

if __name__ == '__main__':
    app.run(debug=True)