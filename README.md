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


### Principios de Clean Code y escalabilidad

Para asegurar un código escalable, mantenible y fácil de extender, se aplicaron principios de Clean Code en ambas apps:

- **Separación de responsabilidades:** Cada archivo y clase tiene una única responsabilidad clara (SRP), evitando lógica mezclada entre UI, servicios y modelos.
- **Nombres descriptivos:** Variables, funciones y clases usan nombres claros y autoexplicativos, facilitando la comprensión y el onboarding de nuevos desarrolladores.
- **Modularidad:** El código está organizado en módulos independientes (`pages/`, `services/`, `models/`, `ui/`), permitiendo agregar o modificar funcionalidades sin afectar otras partes.
- **Evitar duplicidad:** Se centralizan los datos y la lógica compartida, reutilizando servicios y modelos tanto en Flutter como en React.
- **Simplicidad y legibilidad:** Se prioriza la claridad sobre la optimización prematura, con funciones cortas y comentarios solo donde agregan valor.
- **Escalabilidad:** La estructura permite crecer el proyecto agregando nuevas pantallas, servicios o integraciones sin refactorizaciones mayores.

---

## Mejoras futuras

- Backend real: implementación de una base de datos real para reemplazar mocks de `params` y sincronizar saldo y redenciones.
- Autenticación: email/OTP o social login; sesiones seguras y refresh tokens.
- Observabilidad: manejo de errores centralizado, trazas y métricas (Sentry/OpenTelemetry).
- Pruebas y CI: unit/widget/e2e; pipelines para lint, test y build.
- Creación de ventanas para las opciones adjuntas en "Prueba algo diferente" en la ventana de inicio
- Flujo de sesiones de rutinas (al darle en el boton de empezar no sucede nada ahora)
- Agregar lógica de obtención de puntajes
- Dar la posibilidad de editar perfil y el tipo de plan
---

## Resolución de problemas

- Flutter: corre `flutter doctor` para revisar tu entorno. En Windows, si ves errores de permisos, abre la terminal como Administrador.
- React: usa Node 18 o superior. Si falla la instalación, borra `node_modules` y `package-lock.json` y vuelve a ejecutar `npm install`.

---
