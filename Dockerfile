FROM ghcr.io/seravo/flask:latest

ARG APT_PROXY

COPY requirements.txt /app/requirements.txt

RUN pip install -r /app/requirements.txt

ENV FLASK_APP hello:app
COPY /app/ /app/
