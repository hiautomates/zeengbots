# ============================================
# ZeengBots — Sitio estático servido con nginx
# ============================================
FROM public.ecr.aws/nginx/nginx:1.27-alpine


# Configuración personalizada de nginx (URLs limpias, caché, gzip)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Archivos del sitio
COPY site/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
