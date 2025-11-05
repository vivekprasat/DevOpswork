# app.py (Python Flask example)
from flask import Flask
from prometheus_client import generate_latest, Counter, Gauge

app = Flask(__name__)

# Define custom metrics
requests_total = Counter('http_requests_total', 'Total HTTP Requests')
in_progress_requests = Gauge('http_requests_in_progress', 'In-progress HTTP Requests')

@app.route('/')
def hello_world():
    requests_total.inc()
    return 'Hello, World!'

@app.route('/metrics')
def metrics():
    return generate_latest(), 200, {'Content-Type': 'text/plain; version=0.0.4; charset=utf-8'}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)