# Step 1: Use an official Nginx image to serve the app
FROM nginx:alpine as production-stage

# Step 2: Copy the built files from the local machine to Nginx's HTML folder
COPY dist /usr/share/nginx/html

# Step 3: Copy NGINX Configuration file from the local machine to Nginx's Config folder
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Step 3: Expose the default port (optional)
EXPOSE 80

# Step 4: Start Nginx
CMD ["nginx", "-g", "daemon off;"]