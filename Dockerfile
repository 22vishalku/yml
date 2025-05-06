# Use an official Nginx image
FROM nginx:alpine

# Remove default index.html and copy your own
COPY a.html /usr/share/nginx/html/a.html

# Expose port 80
EXPOSE 80
