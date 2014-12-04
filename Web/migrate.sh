#!/bin/bash

DATABASE_URL="postgres://docker:docker@$DATABASE_POSTGRE_HOST:5432/docker"
CELERY_BROKER_URL="redis://$CELERY_BROKER_REDIS_HOST:6379/1"
SES_HOST="$MAIL_EXIM_HOST"
SES_USER=""
SES_PASS=""
SES_PORT="225"

python manage.py collectstatic --noinput &&\
python manage.py compress --force &&\
python manage.py syncdb --noinput && \
python manage.py migrate && \
python manage.py loaddata fixture.json 