FROM nginx:1.25.3

COPY ./src /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf