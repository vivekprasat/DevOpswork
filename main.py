from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    print("hello, py!")
    return "hello, py!"

if __name__ == "__main__":
<<<<<<< HEAD
    app.run(debug=True)
=======
    app.run(debug=True)
>>>>>>> d8586faa5c7bf0ee7cb002ba88c2b07407787c30
