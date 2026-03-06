#!/bin/sh
sleep 5s  # wait until the db is ready
python manage.py migrate
python manage.py runserver 0.0.0.0:8000