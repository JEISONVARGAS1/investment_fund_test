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

## Lógica de negocio

### Flujo de inversión

El proyecto inicia con un **saldo inicial** que el usuario puede utilizar para invertir. La lógica funciona así:

1. **Saldo inicial**: El usuario comienza con un capital disponible (definido en la API, ej. 500.000 COP).

2. **Compra de inversiones**: Al comprar un fondo, se descuenta del saldo disponible el monto de la inversión mínima del fondo. El usuario solo puede comprar si su saldo es mayor o igual a la inversión mínima requerida.

3. **Venta de inversiones**: Al vender, el usuario puede **ganar o perder** dinero sobre lo que pagó por la inversión. El resultado depende de la simulación del mercado.

### Método `simulateSell` (aleatorio)

Se creó el método `simulateSell()` en `lib/core/util/simulate_sale.dart` para simular el resultado de una venta de forma **aleatoria**:

- **Entrada**: El monto que el usuario pagó por la inversión (precio de compra).
- **Salida**: El monto que recibe al vender (precio de venta simulado).
- **Lógica**: Usa `Random` para determinar si hubo ganancia o pérdida (50% de probabilidad cada uno). Aplica un porcentaje aleatorio de variación (±50%) sobre el monto original.
- **Resultado**: Si el monto de venta es mayor que el de compra → ganancia. Si es menor → pérdida. La diferencia se refleja en el saldo disponible y en el historial con indicadores visuales (verde/naranja/rojo).

Este método permite simular la volatilidad del mercado de forma didáctica sin conectar a APIs reales.

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

## Cómo ejecutar la aplicación

La aplicación puede ejecutarse tanto en **web** como en **móvil** (iOS/Android). Sigue estos pasos:

### 0. Clonar el repositorio (si aplica)

```bash
git clone <repository-url>
cd investment_fund
```

### 1. Verificar el entorno Flutter

Antes de ejecutar, asegúrate de que Flutter esté correctamente configurado:

```bash
flutter doctor
```

Este comando verifica que tengas instalados el SDK de Flutter, las herramientas de desarrollo y los dispositivos/emuladores disponibles. Corrige cualquier advertencia que aparezca antes de continuar.

### 2. Instalar dependencias

```bash
flutter pub get
```

Descarga todas las dependencias del proyecto definidas en `pubspec.yaml`.

### 3. Generar código (Riverpod, Freezed)

```bash
dart run build_runner build --delete-conflicting-outputs
```

Genera los providers de Riverpod y los modelos de Freezed.

### 4. Ejecutar la aplicación

**En web (Chrome):**

```bash
flutter run -d chrome
```

**En móvil (dispositivo o emulador conectado):**

```bash
flutter run
```

Si tienes varios dispositivos conectados, especifica el destino:

```bash
# Listar dispositivos disponibles
flutter devices

# Ejecutar en un dispositivo específico
flutter run -d <device_id>
```

**Ejemplos por plataforma:**

```bash
# Web
flutter run -d chrome

# Android (emulador o dispositivo)
flutter run -d android

# iOS (simulador o dispositivo, solo en macOS)
flutter run -d ios
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
