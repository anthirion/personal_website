FROM python:3.14.5-slim-trixie
RUN apt-get update && apt-get install -y libpq-dev gcc
WORKDIR /app
COPY requirements.txt .
RUN python -m pip install -r requirements.txt
COPY manage.py .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
COPY website/ ./website/
COPY blog/ ./blog/
EXPOSE 8000
ENTRYPOINT ["./entrypoint.sh"]