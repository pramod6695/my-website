# Use a stable version of Nginx
FROM nginx:1.25

# Copy index.html to the correct location
COPY index.html /usr/share/nginx/html/index.html
COPY styles.css /usr/share/nginx/html/styles.css

# Expose port 80 to allow access
EXPOSE 80

# Add a health check to monitor the container
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD curl -f http://localhost || exit 1

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
