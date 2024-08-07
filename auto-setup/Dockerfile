FROM temporalio/auto-setup:latest

USER root

# Install MySQL client and CA certificates if needed
RUN apk update && apk add --no-cache mysql-client ca-certificates

# Ensure the script is executable
RUN chmod +x /etc/temporal/auto-setup.sh

USER 10001
# Set the entrypoint to run the auto-setup script
ENTRYPOINT ["/etc/temporal/auto-setup.sh"]
