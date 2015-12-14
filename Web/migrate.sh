#!/bin/bash

export CELERY_BROKER_REDIS_HOST="$REDIS_PORT_6379_TCP_ADDR"
export DATABASE_URL="postgres://docker:docker@$DATABASE_PORT_5432_TCP_ADDR:5432/docker"
export CELERY_BROKER_URL="redis://$CELERY_BROKER_REDIS_HOST:6379/1"

python manage.py collectstatic --noinput &&\
python manage.py compress --force &&\
python manage.py syncdb --noinput && \
python manage.py migrate && \
python manage.py loaddata fixture.json
