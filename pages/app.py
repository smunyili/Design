
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template("login.html")

if __name__ == '__main__':
    app.run()


@app.route('/send', methods=['GET', 'POST'])
def send():
    if request.method == 'POST':
        username = request.form['user-name']
        return render_template("dashboard.html")
    return render_template("index.html")

