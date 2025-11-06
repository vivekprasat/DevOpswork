FROM python:3.12.12-slim
WORKDIR /app
COPY . .
RUN python -m pip install flask
EXPOSE 5000/tcp
CMD ["python","main.py"]
