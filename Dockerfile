FROM nginx:alpine

# Salin hanya file web
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/
COPY Images/ /usr/share/nginx/html/Images/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

