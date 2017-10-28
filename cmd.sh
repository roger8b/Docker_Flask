#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
	echo "Sevidor modo DEV"
	exec python "identidock.py"
else
	echo "Servidor modo PRODUÇÃO"
	exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py \
	     --callable app --stats 0.0.0.0:9191
fi

if [[ condition ]]; then
	#statements
fi