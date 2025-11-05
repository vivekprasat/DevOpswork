from flask import Flask
import random
app=Flask(__name__)
@app.route('/')
def index():
    try:
        if random.choice([True, False]):
            raise Exception("Random failure occurred!")
        return "App running successfully!"
    except Exception as e:
        app.logger.error(f"Error: {e}")
        return "Temporary issue, please retry later", 500

if __name__ == '__main__':
    app.run(debug=True)