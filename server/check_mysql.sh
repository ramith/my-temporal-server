#!/bin/sh

set -eu

MYSQL_HOST=${MYSQL_SEEDS}
MYSQL_PORT=${DB_PORT:-3306}
MYSQL_USER=${MYSQL_USER}
MYSQL_PASSWORD=${MYSQL_PWD}
DBNAME=${DBNAME}
VISIBILITY_DBNAME=${VISIBILITY_DBNAME}
SSL_CA=${SSL_CA:-/etc/ssl/certs/ca-certificates.crt}

echo "Checking MySQL connection details:"
echo "  MySQL Host: ${MYSQL_HOST}"
echo "  MySQL Port: ${MYSQL_PORT}"
echo "  MySQL User: ${MYSQL_USER}"
echo "  Database: ${DBNAME}"
echo "  Visibility Database: ${VISIBILITY_DBNAME}"

# Wait until MySQL is available
until mysql --ssl-ca="${SSL_CA}" -h"${MYSQL_HOST}" -P"${MYSQL_PORT}" -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" -e "SELECT 1" > /dev/null 2>&1; do
  echo "Waiting for MySQL to be available..."
  sleep 2
done

# Check if the databases exist
databases=$(mysql --ssl-ca="${SSL_CA}" -h"${MYSQL_HOST}" -P"${MYSQL_PORT}" -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" -e "SHOW DATABASES LIKE '${DBNAME}'")
if [ -z "$databases" ]; then
  echo "Database ${DBNAME} does not exist."
  exit 1
fi

databases=$(mysql --ssl-ca="${SSL_CA}" -h"${MYSQL_HOST}" -P"${MYSQL_PORT}" -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" -e "SHOW DATABASES LIKE '${VISIBILITY_DBNAME}'")
if [ -z "$databases" ]; then
  echo "Database ${VISIBILITY_DBNAME} does not exist."
  exit 1
fi

echo "MySQL is available and required databases exist."
