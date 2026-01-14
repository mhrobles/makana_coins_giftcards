# Makana Coins & Giftcards

Guía rápida para correr el proyecto, decisiones de UX y técnicas, mejoras futuras y diferencias entre la app Flutter y la app React.

## Estructura del repositorio

- Flutter (app móvil/desktop/web): [flutter_app/](flutter_app)
- React + Vite (web): [web-app/](web-app)
- Datos mock compartidos: [params/](params) (`coins.json`, `giftcards_catalog.json`, `user_giftcards.json`)

---

## Cómo correr el proyecto

### Requisitos

- Flutter: Flutter estable reciente (Dart >= 3.10.7), Android SDK opcional para Android, Xcode solo si compilas iOS (macOS).
- React: Node.js >= 18 (recomendado 20 LTS) y pnpm/npm/yarn.

### App Flutter (multi-plataforma)

1) Instalar dependencias

```bash
cd flutter_app
flutter pub get
```

2) Ejecutar según plataforma

- Android (emulador/dispositivo):

```bash
flutter run -d android
```

- Windows (esta máquina):

```bash
flutter run -d windows
```

- Web (Chrome):

```bash
flutter run -d chrome
```

Notas:
- Asegurarse de tener el dispositivo listado (revisar con `flutter devices`).
- iOS requiere macOS + Xcode.

### App React (Vite + TypeScript)

1) Instalar dependencias

```bash
cd web-app
npm install
```

2) Ejecución

```bash
npm run dev
```

La app usa Vite; las rutas están definidas con `react-router-dom`.

### Datos (params)

- Ambos proyectos pueden consumir los JSON locales en [params/](params) para simular API.

---

## Decisiones de UX

- Prioridad a la claridad: navegación simple y textos ordenados para entender rápido cómo ver monedas y giftcards.
- Botones principales a la vista: comprar o redimir están destacados; opciones como filtrar u ordenar están a mano, sin estorbar.
- Avisos claros: cuando está cargando, no hay datos o ocurre un error, mostramos un mensaje sencillo y la opción de reintentar.
- Accesible por defecto: buen contraste, botones cómodos para tocar y un indicador visible de selección en la web.

---

## Decisiones técnicas

### Flutter

- Persistencia local: `shared_preferences` para guardar estado ligero del usuario y preferencias.
- Estructura: separación por `pages/`, `services/`, `models/`, `ui/` en [flutter_app/lib/](flutter_app/lib).
- Datos locales: lectura de JSON de `params` (o assets) para catálogos y estado del usuario en desarrollo.
- Multiplataforma: mismo código para Android, iOS, web y desktop; variaciones solo donde aplica.

### React (Vite + TS)

- Build rápido: Vite para DX ágil y HMR.
- Routing: `react-router-dom` para navegación SPA.
- Tipado: TypeScript en [web-app/src/](web-app/src) con `types/` y utilidades compartidas.
- Configuraciones mínimas: ESLint y TS estrictos para mantener calidad sin sobrecarga.

---

## Mejoras futuras

- Backend real: exposiciones REST/GraphQL para reemplazar mocks de `params` y sincronizar saldo y redenciones.
- Autenticación: email/OTP o social login; sesiones seguras y refresh tokens.
- Estado avanzado: Flutter (Riverpod/Bloc); React (Context + Reducer o Zustand/Redux) para flujos complejos.
- Observabilidad: manejo de errores centralizado, trazas y métricas (Sentry/OpenTelemetry).
- Accesibilidad e i18n: WCAG AA y traducciones (ES/EN) con fallback.
- Rendimiento: code-splitting en React, imágenes responsivas y caching; en Flutter, `const` widgets y memoización.
- Pruebas y CI: unit/widget/e2e; pipelines para lint, test y build.

---

## Resolución de problemas

- Flutter: corre `flutter doctor` para revisar tu entorno. En Windows, si ves errores de permisos, abre la terminal como Administrador.
- React: usa Node 18 o superior. Si falla la instalación, borra `node_modules` y `package-lock.json` y vuelve a ejecutar `npm install`.

---
