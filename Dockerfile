# Use official Nginx image as base
FROM nginx:latest

# Remove the default Nginx index page (optional)
RUN rm /usr/share/nginx/html/index.html

# Copy your custom index.html into the Nginx HTML directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
