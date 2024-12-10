from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)


@app.route('/')
def hello():
    return render_template('index.html', title="Accueil")

@app.route('/about')
def about():
    return render_template('about.html', title="A propos")

# @app.route('/contact')
# def contact():
#     return render_template('contact.html', title="Accueil")

@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        if not name or not email:
            # Rediriger vers la page d'erreur si le formulaire n'est pas rempli
            return redirect(url_for('error'))
        return render_template('confirmation.html', title="Confirmation", name=name)
    return render_template('contact.html', title="Contact")

@app.route('/error')
def error():
    return render_template('error.html', title="Erreur")

if __name__ == '__main__':
    app.run(debug=True)