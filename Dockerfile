FROM nginx:1.27-alpine
ENV PORT=10000
COPY index.html /usr/share/nginx/html/index.html
RUN mkdir -p /etc/nginx/templates && printf 'server {\n  listen ${PORT};\n  root /usr/share/nginx/html;\n  index index.html;\n  gzip on;\n  gzip_types text/html text/css application/javascript;\n  gzip_min_length 1024;\n  location / { try_files $uri /index.html; }\n}\n' > /etc/nginx/templates/default.conf.template
