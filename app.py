
from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return "Hello world.This is samuel speaking.\rHow are you out there?"

if __name__ == "__main__":
    app.run()