FROM temporalio/server:latest

USER root

# Install MySQL client and CA certificates
RUN apk update && apk add --no-cache mysql-client ca-certificates

# Copy everything from /etc/temporal in temporalio/auto-setup:latest image to /etc/temporal in this image
COPY --from=temporalio/auto-setup:latest /etc/temporal /etc/temporal

# Ensure all scripts are executable
RUN chmod +x /etc/temporal/*.sh

# Copy start.sh and check_mysql.sh to /etc/temporal
COPY start.sh /etc/temporal/start.sh
COPY check_mysql.sh /etc/temporal/check_mysql.sh

# Ensure the copied scripts are executable
RUN chmod +x /etc/temporal/start.sh /etc/temporal/check_mysql.sh

USER 10001

ENTRYPOINT ["sh", "/etc/temporal/start.sh"]
