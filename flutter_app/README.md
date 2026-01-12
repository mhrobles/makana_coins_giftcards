# Makana Flutter App (mínimos)

SPA móvil con tres vistas: Inicio, Ranking y Perfil, usando UI simple y datos mock para cumplir los requerimientos mínimos.

## Ejecutar

```bash
cd flutter_app
flutter pub get
flutter run
```

## Estructura

- `lib/main.dart`: Configura `MaterialApp` y `NavigationBar` con tres pantallas.
- Vistas: `HomePage`, `RankingPage`, `ProfilePage` con componentes básicos (`_Card`, `_Badge`).

## Notas

- No usa paquetes externos; todo es Flutter estándar.
- Los datos son estáticos y pueden conectarse a API más adelante.
