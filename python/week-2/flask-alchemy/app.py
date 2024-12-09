from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
# app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///tasks.db'
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///app.db'
db = SQLAlchemy(app)

class Task(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    completed = db.Column(db.Boolean, default=False)

@app.route('/')
def index():
    sort_by = request.args.get('sort_by', 'created')  # default sorting: created
    order = request.args.get('order', 'asc')          # default order: asc

    if sort_by == 'completed':
        if order == 'desc':
            tasks = Task.query.order_by(Task.completed.desc(), Task.id.desc()).all()
        else:
            tasks = Task.query.order_by(Task.completed.asc(), Task.id.asc()).all()
    else:
        # sort_by = 'created'
        if order == 'desc':
            tasks = Task.query.order_by(Task.id.desc()).all()
        else:
            tasks = Task.query.order_by(Task.id.asc()).all()

    return render_template('index.html', tasks=tasks)

@app.route('/add', methods=['POST'])
def add():
    task_title = request.form.get('title')
    if task_title:
        new_task = Task(title=task_title)
        db.session.add(new_task)
        db.session.commit()
    return redirect(url_for('index'))

@app.route('/complete/<int:id>', methods=['POST'])
def complete(id):
    task = Task.query.get_or_404(id)
    task.completed = True
    db.session.commit()
    return redirect(url_for('index'))

@app.route('/delete/<int:id>', methods=['POST'])
def delete(id):
    task = Task.query.get_or_404(id)
    db.session.delete(task)
    db.session.commit()
    return redirect(url_for('index'))

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    app.run(debug=True)