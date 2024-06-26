# Use an official Docker image as a parent image
FROM temporalio/server:latest

COPY config_template.yaml /etc/temporal/config/config_template.yaml

# Expose the necessary ports
EXPOSE 7233
# Create a non-root user with a user ID (e.g., 1001)
USER 10014
# Start Temporal server with environment variables for MySQL connection
CMD ["temporal-server", "start"]
