# ZeengBots — Sitio web

Sitio estático de ZeengBots (6 páginas) servido con nginx vía Docker.

## Estructura

```
.
├── Dockerfile        # Imagen nginx:alpine que sirve el sitio
├── nginx.conf        # URLs limpias (/pricing, /cases…), gzip y caché
└── site/             # Archivos del sitio
    ├── index.html
    ├── pricing.html
    ├── cases.html
    ├── blog.html
    ├── docs.html
    ├── contact.html
    ├── styles.css
    ├── logo.png
    └── hero-face.png
```

## URLs limpias

Gracias a `nginx.conf`, el sitio responde igual que el original:

- `/` → inicio
- `/pricing` → precios
- `/cases` → casos
- `/blog` → blog
- `/docs` → documentación
- `/contact` → contacto

## Probar localmente (opcional, requiere Docker)

```bash
docker build -t zeengbots .
docker run -p 8080:80 zeengbots
# Abrir http://localhost:8080
```

## Subir a Git

```bash
git init
git add .
git commit -m "Sitio ZeengBots inicial"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/zeengbots.git
git push -u origin main
```

## Desplegar en EasyPanel

1. En EasyPanel: **Create Project** → nombre `zeengbots`
2. Dentro del proyecto: **+ Service** → **App**
3. En **Source**, elige **GitHub** y conecta el repositorio `zeengbots` (rama `main`)
4. En **Build**, selecciona **Dockerfile** (ruta: `Dockerfile`, contexto: `/`)
5. **Deploy**
6. En la pestaña **Domains** del servicio:
   - EasyPanel te da un subdominio automático para probar
   - Agrega tu dominio propio (ej. `zeengbots.com`) apuntando el DNS
     con un registro **A** a la IP de tu servidor
   - Activa **HTTPS** (Let's Encrypt) con un clic
   - Puerto del contenedor: **80**

Cada vez que hagas `git push`, puedes redesplegar desde EasyPanel
(o activa **Auto Deploy** con el webhook de GitHub para que sea automático).
