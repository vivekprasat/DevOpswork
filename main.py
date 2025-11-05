from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    print("hello, py!")
    return "hello, py!"

if __name__ == "__main__":
    app.run(debug=True)