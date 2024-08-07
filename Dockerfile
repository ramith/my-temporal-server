FROM temporalio/server:latest

USER root

# Install MySQL client and CA certificates
RUN apk update && apk add --no-cache mysql-client ca-certificates

# Copy auto-setup.sh from the temporalio/auto-setup image
COPY --from=temporalio/auto-setup:latest /auto-setup.sh /etc/temporal/auto-setup.sh

# Make the script executable
RUN chmod +x /etc/temporal/auto-setup.sh

USER 10001

COPY start.sh /etc/temporal/start.sh
COPY check_mysql.sh /etc/temporal/check_mysql.sh

ENTRYPOINT ["sh", "/etc/temporal/start.sh"]
