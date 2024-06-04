# Use an official Docker image as a parent image
FROM temporalio/server:1.15.0

# Expose the necessary ports
EXPOSE 7233
# Create a non-root user with a user ID (e.g., 1001)
USER 10014
# Start Temporal server with environment variables for MySQL connection
CMD ["temporal-server", "start"]
