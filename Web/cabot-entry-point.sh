#!/bin/bash

set -e

cd /cabot/
source env_vars.sh
exec ./migrate.sh
exec ./run.sh

exec "$@"



