# Makana Web App

SPA en React + TypeScript + Vite organizada según principios de Clean Code y programación funcional.

## Ejecutar

```bash
cd web-app
npm install
npm run dev
```

## Arquitectura limpia (feature-first)

- `src/app` (no imprescindible por ahora): inicialización, providers y router.
- `src/components/`:
	- `Header.tsx`: navegación.
	- `ui/`: primitivas puras y reutilizables (`Card`, `Button`, `Badge`, `Row`, `Section`, `Title`).
- `src/features/`:
	- `home/HomePage.tsx`
	- `ranking/RankingPage.tsx`
	- `profile/ProfilePage.tsx`
- `src/services/`: funciones puras que proveen datos mock (sin efectos).
- `src/types/`: tipos de dominio (`LeaderEntry`, `ProfileStats`, etc.).
- `src/utils/`: utilidades puras de formato y ordenamiento.

### Principios aplicados

- Componentes puros con props explícitas y sin efectos secundarios.
- Separación de responsabilidades: UI, lógica de dominio y acceso a datos.
- Utilidades y tipos compartidos centralizados.
- Importaciones claras y rutas por feature.

## Notas

- Los datos son mock y deterministas para mantener pureza funcional.
- Estilos globales en `src/components/header.css` y `src/index.css`.
