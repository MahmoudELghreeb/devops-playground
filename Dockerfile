# Use lightweight base image
FROM alpine:latest

# Set working directory
WORKDIR /app

# Copy script
COPY scripts/file-manager.sh /app/file-manager.sh

# Make script executable
RUN chmod +x /app/file-manager.sh

# Default command
CMD ["/app/file-manager.sh"]
