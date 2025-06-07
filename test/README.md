# Tests - Weather App 🧪

Esta carpeta contiene todos los tests unitarios, de widgets e integración para la aplicación del clima.

## 📁 Estructura de Tests

```
test/
├── features/
│   ├── weather/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── weather_entities_test.dart
│   │   │   └── repositories/
│   │   │       └── weather_repository_test.dart
│   │   └── presentation/
│   │       ├── providers/
│   │       │   ├── weather_provider_test.dart
│   │       │   └── favorites_provider_test.dart
│   │       └── widgets/
│   │           └── weather_current_card_test.dart
│   └── favorites/
│       └── data/
│           └── repositories/
│               └── favorites_repository_test.dart
├── test_runner.dart
└── README.md

integration_test/
└── app_test.dart
```

## 🛠️ Configuración Inicial

### 1. Instalar Dependencias

```bash
flutter pub get
```

### 2. Generar Mocks

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 3. Instalar lcov para reportes de cobertura (opcional)

**macOS:**
```bash
brew install lcov
```

**Linux:**
```bash
sudo apt-get install lcov
```

## 🚀 Ejecutar Tests

### Comandos Básicos

```bash
# Ejecutar todos los tests
flutter test

# Ejecutar tests con cobertura
flutter test --coverage

# Ejecutar tests en modo watch
flutter test --watch

# Ejecutar test específico
flutter test test/features/weather/domain/entities/weather_entities_test.dart
```

### Usando Makefile (Recomendado)

```bash
# Ver todos los comandos disponibles
make help

# Ejecutar tests unitarios
make test

# Ejecutar tests con cobertura
make test-coverage

# Ejecutar tests en modo watch
make test-watch

# Generar mocks
make mocks

# Configuración inicial completa
make setup

# Verificación completa (análisis + formato + tests + cobertura)
make verify
```

### Tests por Categoría

```bash
# Tests de weather feature
make test-weather

# Tests de favorites feature
make test-favorites

# Tests de providers
make test-providers

# Tests de widgets
make test-widgets
```

## 📊 Reporte de Cobertura

Después de ejecutar `make test-coverage`, el reporte HTML estará disponible en:
```
coverage/html/index.html
```

Abre este archivo en tu navegador para ver el reporte detallado de cobertura.

## 🧪 Tipos de Tests

### 1. Tests Unitarios

**Ubicación:** `test/features/`

Testean la lógica de negocio de forma aislada:
- Repositories
- Entities
- Use cases
- Providers/Notifiers

**Ejemplo:**
```dart
test('should return WeatherCurrent when API call succeeds', () async {
  // Arrange
  when(mockApiService.getCurrentWeather(any, any, any, any, any))
      .thenAnswer((_) async => tWeatherResponseDto);

  // Act
  final result = await repository.getCurrentWeather(tLocation);

  // Assert
  expect(result.isSuccess, true);
  expect(result.data, isA<WeatherCurrent>());
});
```

### 2. Tests de Widgets

**Ubicación:** `test/features/*/presentation/widgets/`

Testean la UI y la interacción:
- Widgets individuales
- Interacciones de usuario
- Estados de la UI

**Ejemplo:**
```dart
testWidgets('should display weather location', (tester) async {
  // Act
  await tester.pumpWidget(createTestWidget(testWeather));

  // Assert
  expect(find.text('Test Location'), findsOneWidget);
});
```

### 3. Tests de Integración

**Ubicación:** `integration_test/`

Testean flujos completos de la aplicación:
- Navegación entre pantallas
- Flujos de usuario completos
- Integración entre componentes

**Ejemplo:**
```dart
testWidgets('should navigate to favorites page', (tester) async {
  // Arrange
  app.main();
  await tester.pumpAndSettle();

  // Act
  await tester.tap(find.byIcon(Icons.favorite));
  await tester.pumpAndSettle();

  // Assert
  expect(find.text('Eventos Favoritos'), findsOneWidget);
});
```

## 🎯 Estrategia de Testing

### Cobertura Objetivo

- **Repositories:** 100%
- **Providers/Notifiers:** 95%
- **Entities:** 100%
- **Widgets críticos:** 90%
- **Flujos principales:** 100%

### Pirámide de Tests

```
        /\
       /  \
      / UI \
     /______\
    /        \
   /Integration\
  /____________\
 /              \
/   Unit Tests   \
/________________\
```

- **70% Unit Tests:** Rápidos, específicos, muchos
- **20% Integration Tests:** Verifican flujos completos
- **10% UI Tests:** E2E críticos

## 🔧 Mocking Strategy

### Usando Mockito

Los mocks se generan automáticamente usando `@GenerateMocks`:

```dart
@GenerateMocks([
  WeatherApiService,
  SharedPreferences,
  Connectivity,
  Logger,
])
void main() {
  late MockWeatherApiService mockApiService;
  
  setUp(() {
    mockApiService = MockWeatherApiService();
  });
}
```

### Mocks Disponibles

- `MockWeatherApiService`
- `MockFavoritesRepository`
- `MockWeatherRepository`
- `MockSharedPreferences`
- `MockConnectivity`
- `MockLogger`

## 📋 Checklist de Testing

### Antes de hacer commit:

- [ ] Todos los tests pasan: `make test`
- [ ] Cobertura > 80%: `make test-coverage`
- [ ] Código formateado: `make format`
- [ ] Sin warnings: `make analyze`
- [ ] Tests de integración pasan
- [ ] Mocks actualizados si es necesario

### Nuevas features:

- [ ] Tests unitarios para nueva lógica
- [ ] Tests de widgets para nueva UI
- [ ] Tests de integración para nuevos flujos
- [ ] Mocks para nuevas dependencias
- [ ] Actualizar documentación

## 🐛 Debugging Tests

### Test que falla

```bash
# Ejecutar test específico con verbose
flutter test test/path/to/test.dart --reporter expanded

# Ejecutar con debug
flutter test test/path/to/test.dart --start-paused
```

### Widget test que falla

```bash
# Usar debugDumpApp() en el test
await tester.pumpWidget(widget);
debugDumpApp(); // Imprime el árbol de widgets
```

### Provider test que falla

```bash
# Verificar el estado del provider
print(container.read(providerName));
```

## Recursos Adicionales

- [Flutter Testing Guide](https://docs.flutter.dev/testing)
- [Mockito Documentation](https://pub.dev/packages/mockito)
- [Integration Testing](https://docs.flutter.dev/testing/integration-tests)
- [Riverpod Testing](https://riverpod.dev/docs/cookbooks/testing)

## Contribuir

1. Escribe tests para toda nueva funcionalidad
2. Mantén los tests simples y legibles
3. Usa nombres descriptivos
4. Sigue el patrón Arrange-Act-Assert
5. Mantén la cobertura alta

## ⚡ Tips y Trucos

### Acelerar tests

```dart
// Usar fakes en lugar de mocks cuando sea posible
class FakeSharedPreferences extends Fake implements SharedPreferences {
  final Map<String, dynamic> _data = {};
  
  @override
  String? getString(String key) => _data[key] as String?;
}
```

### Tests más legibles

```dart
// Usar builders para crear objetos de test
WeatherCurrent createTestWeather({
  String location = 'Test Location',
  double temperature = 25.0,
}) {
  return WeatherCurrent(
    location: location,
    temperature: temperature,
    // ... otros campos con defaults
  );
}
```

### Verificar interacciones

```dart
// Verificar que un método fue llamado con parámetros específicos
verify(mockRepository.getCurrentWeather(
  argThat(isA<LocationInfo>().having(
    (l) => l.name, 
    'name', 
    'Test Location'
  ))
)).called(1);
```