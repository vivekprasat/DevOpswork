FROM python:trixie
WORKDIR /app
COPY . .
RUN python -m pip install flask
EXPOSE 5000
CMD ["python","main.py"]