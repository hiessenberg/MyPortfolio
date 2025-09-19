# Use Nginx as base image
FROM nginx:alpine

# Install unzip
RUN apk add --no-cache unzip

# Copy your zipped portfolio into container
COPY portfolio.zip /tmp/portfolio.zip

# Unzip into nginx html folder
RUN rm -rf /usr/share/nginx/html/* \
    && unzip /tmp/portfolio.zip -d /usr/share/nginx/html \
    && rm /tmp/portfolio.zip

# Expose port 80
EXPOSE 7001

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
