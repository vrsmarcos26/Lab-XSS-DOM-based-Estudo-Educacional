FROM nginx:alpine

# Copia os arquivos estáticos para o Nginx
COPY index.html /usr/share/nginx/html/index.html

# Ajusta permissões
RUN chown -R nginx:nginx /usr/share/nginx/html/