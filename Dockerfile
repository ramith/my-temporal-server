# Use an official Docker image as a parent image
FROM temporalio/server:1.15.0

# Expose the necessary ports
EXPOSE 7233

# Start Temporal server with environment variables for MySQL connection
CMD ["temporal-server", "start"]
