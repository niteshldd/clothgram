#!/bin/bash
python3 manage.py migrate --no-input
python3 manage.py collectstatic --noinput
python3 manage.py populatedb --createsuperuser
python3 manage.py runserver 0.0.0.0:8000
celery -A saleor worker --app=saleor.celeryconf:app --loglevel=info
uwsgi --ini /app/saleor/wsgi/uwsgi.ini
