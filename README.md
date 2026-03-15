# Investment Fund

Aplicación multiplataforma para la gestión de inversiones y fondos de inversión. Desarrollada con Flutter para **móvil** (iOS/Android) y **web**, permitiendo a los usuarios explorar fondos, realizar compras y ventas simuladas, y consultar su historial de inversiones.

## Características principales

- **Exploración de fondos**: Catálogo de fondos de inversión (FPV, FIC) con información detallada
- **Compra de inversiones**: Adquisición de fondos validando saldo disponible e inversión mínima
- **Venta de inversiones**: Simulación de venta con cálculo aleatorio de ganancia/pérdida (50/50)
- **Historial de transacciones**: Registro completo de compras y ventas con indicadores visuales (ganancia/pérdida)
- **Dashboard responsive**: Vista adaptativa para móvil, tablet y escritorio
- **Navegación web**: URLs limpias con PathUrlStrategy para compartir y recargar rutas
- **Internacionalización**: Soporte para español e inglés

## Stack tecnológico

| Tecnología | Uso |
|------------|-----|
| **Flutter** | Framework multiplataforma |
| **Dart 3.11+** | Lenguaje de programación |
| **Riverpod** | Gestión de estado (provider pattern) |
| **GoRouter** | Navegación declarativa y deep linking |
| **Freezed** | Modelos inmutables y pattern matching |
| **fl_chart** | Gráficos y visualización de datos |
| **Google Fonts** | Tipografía (Source Code Pro) |

## Arquitectura: Clean Architecture

El proyecto sigue los principios de **Clean Architecture**, separando responsabilidades en capas bien definidas:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        PRESENTATION LAYER                                 │
│  (UI, Widgets, Controllers/Providers)                                    │
│                                                                         │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────────┐  │
│  │   Splash    │ │   Lobby     │ │    Home     │ │ InvestmentDetail │  │
│  │   Profile   │ │   Stocks    │ │             │ │                 │  │
│  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────────┘  │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                        DOMAIN LAYER                                      │
│  (Models, Business Logic)                                                │
│                                                                         │
│  UserModel │ FundModel │ InvestmentRecordsModel │ Constants             │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                        DATA LAYER                                        │
│  (Repositories, API, Data Sources)                                       │
│                                                                         │
│  GlobalRepository │ GlobalApi │ GlobalApiInterface                       │
└─────────────────────────────────────────────────────────────────────────┘
```

### Capas

- **Presentation**: Features con `ui/` (páginas, widgets) y `provider/` (controllers, state)
- **Domain**: Modelos de negocio en `core/model/`
- **Data**: Repositorios e interfaces de API en `core/data/`

## Estructura del proyecto

```
lib/
├── app.dart                    # Punto de entrada de la aplicación
├── main.dart                   # Inicialización (usePathUrlStrategy para web)
├── router.dart                 # Configuración de rutas GoRouter
│
├── core/                       # Núcleo compartido
│   ├── data/                   # Capa de datos
│   │   ├── data/               # Implementaciones API
│   │   ├── provider/           # Estado global (GlobalController)
│   │   └── repositories/      # Repositorios
│   ├── extension/              # Extensiones (ContextExtension)
│   ├── model/                  # Modelos de dominio
│   ├── theme/                  # Colores, tipografía, spacing
│   ├── util/                   # Utilidades (moneyFormat, constants)
│   └── widget/                 # Widgets reutilizables
│
├── feature/                    # Módulos por funcionalidad
│   ├── splash/                 # Pantalla de carga inicial
│   ├── lobby/                  # Shell con navegación (Home, Stocks, Profile)
│   ├── home/                   # Dashboard principal
│   │   ├── provider/           # HomeController, HomeState
│   │   └── ui/widgets/         # CustomMyBelongings, CustomInvestmentHistory, etc.
│   ├── stocks/                 # Vista de acciones y tendencias
│   ├── investment_detail/     # Detalle de fondo (compra/venta)
│   └── profile/                # Perfil de usuario
│
└── l10n/                       # Localizaciones (es, en)
```

## Diagrama de flujo de navegación

```
                    ┌──────────┐
                    │  Splash  │
                    └────┬─────┘
                         │
                         ▼
                    ┌──────────┐
                    │  Lobby   │◄──────────────────────┐
                    └────┬─────┘                       │
                         │                             │
         ┌────────────────┼────────────────┐          │
         │                │                │          │
         ▼                ▼                ▼          │
    ┌─────────┐     ┌──────────┐     ┌─────────┐        │
    │  Home   │     │ Stocks  │     │ Profile │        │
    └────┬────┘     └────┬────┘     └─────────┘        │
         │               │                              │
         │    Tap fund    │    Tap fund                  │
         └───────┬───────┘                              │
                 │                                       │
                 ▼                                       │
         ┌──────────────────┐                            │
         │ Investment Detail │ ──── Back ────────────────┘
         │ /lobby/investment/│
         │    :assetName     │
         └──────────────────┘
```

## Gestión de estado con Riverpod

Se utiliza **Riverpod** como solución de state management:

- **Providers generados**: `@riverpod` con code generation para type-safety
- **Controllers por feature**: Cada módulo tiene su controller (HomeController, StockController, etc.)
- **Estado global**: GlobalController para usuario y datos compartidos
- **Escucha reactiva**: `ref.watch` y `ref.listen` para actualizaciones en tiempo real

## Plataformas soportadas

| Plataforma | Estado |
|------------|--------|
| **Android** | ✅ Soportado |
| **iOS** | ✅ Soportado |
| **Web** | ✅ Soportado (PathUrlStrategy para URLs limpias) |

## Requisitos

- Flutter 3.11+
- Dart 3.11+

## Instalación

```bash
# Clonar el repositorio
git clone <repository-url>
cd investment_fund

# Instalar dependencias
flutter pub get

# Generar código (Riverpod, Freezed)
dart run build_runner build --delete-conflicting-outputs

# Ejecutar en dispositivo/emulador
flutter run

# Ejecutar en web
flutter run -d chrome
```

## Scripts útiles

```bash
# Generar providers y modelos
dart run build_runner build --delete-conflicting-outputs

# Analizar código
flutter analyze

# Formatear código
dart format lib/
```

## Licencia

Este proyecto es de uso educativo/demostrativo.
