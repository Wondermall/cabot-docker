#!/bin/bash

DATABASE_URL="postgres://docker:docker@$DATABASE_POSTGRE_HOST:5432/docker"
CELERY_BROKER_URL="redis://$CELERY_BROKER_REDIS_HOST:6379/1"
SES_HOST="$MAIL_EXIM_HOST"
SES_USER=""
SES_PASS=""
SES_PORT="225"

service nginx restart &&\
gunicorn cabot.wsgi:application --config gunicorn.conf --log-level info --log-file /var/log/gunicorn &\
celery worker -B -A cabot --loglevel=INFO --concurrency=16 -Ofair
