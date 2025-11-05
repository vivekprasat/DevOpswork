# app.py
from flask import Flask
import random
import logging

# Configure logging (create a file named app.log)
logging.basicConfig(
    filename='app.log',
    level=logging.ERROR,
    format='%(asctime)s %(levelname)s:%(message)s'
)

app = Flask(__name__)

@app.route('/')
def index():
    try:
        # Random failure simulation
        if random.choice([True, False]):
            raise Exception("Random failure occurred!")
        return "App running successfully!"
    except Exception as e:
        # Log the error message to app.log
        logging.error(f"Error occurred: {e}")
        return "Something went wrong! Check app.log for details.", 500

if __name__ == '__main__':
    app.run(debug=True)
