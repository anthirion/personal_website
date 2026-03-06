FROM python:3.15.0a6-slim-trixie
RUN apt-get update && apt-get install -y libpq-dev gcc
WORKDIR /app
COPY blog/ ./blog/
COPY website/ ./website/
COPY requirements.txt .
COPY manage.py .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
RUN python -m pip install -r requirements.txt
EXPOSE 8000
ENTRYPOINT ["./entrypoint.sh"]