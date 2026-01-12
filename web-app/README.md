# Makana Web App (mínimos)

Pequeña SPA hecha con React + TypeScript + Vite para cumplir los requerimientos mínimos del desafío: vistas de Inicio, Ranking y Perfil con datos mock y estilos simples.

## Ejecutar

```bash
cd web-app
npm install
npm run dev
```

Abre el enlace que muestra Vite y navega con la barra superior.

## Estructura

- `src/components/Header.tsx`: navegación entre vistas.
- `src/pages/Home.tsx`: saludo, banner, rutinas y acciones.
- `src/pages/Ranking.tsx`: posición del usuario y Top 10.
- `src/pages/Perfil.tsx`: estadísticas, información personal y plan.

## Notas

- Los datos son estáticos para la entrega mínima.
- Estilos en `src/components/header.css` y `src/index.css` con enfoque responsive.
