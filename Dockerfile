FROM temporalio/server:latest

USER root

# Install MySQL client and CA certificates
RUN apk update && apk add --no-cache mysql-client ca-certificates

USER temporal

COPY start.sh start.sh
COPY check_mysql.sh check_mysql.sh

ENTRYPOINT ["sh", "./start.sh"]
