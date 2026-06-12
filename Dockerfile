# ============================================
# ZeengBots — Sitio estático servido con nginx
# ============================================
FROM public.ecr.aws/nginx/nginx:1.27-alpine


# Configuración personalizada de nginx (URLs limpias, caché, gzip)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Archivos del sitio
COPY site/ /usr/share/nginx/html/

EXPOSE 80

# Healthcheck para que EasyPanel sepa que el contenedor está sano
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -q --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
