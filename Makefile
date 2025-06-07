# Makefile para facilitar la ejecución de tests y tareas comunes
# Ubicación: RAÍZ del proyecto (weather_app/Makefile)

.PHONY: help test test-watch test-coverage mocks clean build

# Ayuda - comando por defecto
help:
	@echo "🧪 Weather App - Comandos disponibles:"
	@echo ""
	@echo "📋 Tests:"
	@echo "  make test          - Ejecuta todos los tests unitarios"
	@echo "  make test-watch    - Ejecuta tests en modo watch"
	@echo "  make test-coverage - Ejecuta tests con reporte de cobertura"
	@echo "  make test-integration - Ejecuta tests de integración"
	@echo ""
	@echo "🎯 Tests específicos:"
	@echo "  make test-weather    - Tests de weather feature"
	@echo "  make test-favorites  - Tests de favorites feature"
	@echo "  make test-providers  - Tests de providers"
	@echo "  make test-widgets    - Tests de widgets"
	@echo ""
	@echo "🔧 Herramientas:"
	@echo "  make mocks         - Genera mocks para testing"
	@echo "  make clean         - Limpia archivos generados"
	@echo "  make build         - Ejecuta build_runner"
	@echo "  make setup         - Configuración inicial del proyecto"
	@echo "  make analyze       - Analiza el código"
	@echo "  make format        - Formatea el código"
	@echo "  make verify        - Verificación completa"

# Ejecutar tests unitarios
test:
	@echo "🧪 Ejecutando tests unitarios..."
	flutter test

# Ejecutar tests en modo watch (observa cambios)
test-watch:
	@echo "👀 Ejecutando tests en modo watch..."
	flutter test --watch

# Ejecutar tests con cobertura
test-coverage:
	@echo "📊 Ejecutando tests con cobertura..."
	flutter test --coverage
	@if command -v lcov >/dev/null 2>&1; then \
		echo "📋 Generando reporte HTML..."; \
		genhtml coverage/lcov.info -o coverage/html; \
		echo "✅ Reporte disponible en coverage/html/index.html"; \
		open coverage/html/index.html 2>/dev/null || echo "📂 Abre coverage/html/index.html en tu navegador"; \
	else \
		echo "⚠️  lcov no está instalado. El archivo coverage/lcov.info está disponible."; \
		echo "💡 Instala lcov: brew install lcov (macOS) | apt-get install lcov (Linux)"; \
	fi

# Ejecutar tests de integración
test-integration:
	@echo "🔄 Ejecutando tests de integración..."
	flutter test integration_test/

# Generar mocks
mocks:
	@echo "🤖 Generando mocks..."
	dart run build_runner build --delete-conflicting-outputs

# Limpiar archivos generados
clean:
	@echo "🧹 Limpiando archivos generados..."
	flutter clean
	dart run build_runner clean

# Ejecutar build_runner
build:
	@echo "🔨 Ejecutando build_runner..."
	dart run build_runner build

# Configuración inicial
setup:
	@echo "⚙️  Configurando proyecto..."
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs
	@echo "✅ Configuración completada"

# Ejecutar tests específicos
test-weather:
	@echo "🌤️  Ejecutando tests de weather..."
	flutter test test/features/weather/

test-favorites:
	@echo "⭐ Ejecutando tests de favorites..."
	flutter test test/features/favorites/

test-providers:
	@echo "🔧 Ejecutando tests de providers..."
	flutter test test/features/weather/presentation/providers/

test-widgets:
	@echo "🎨 Ejecutando tests de widgets..."
	flutter test test/features/weather/presentation/widgets/

# Análisis de código
analyze:
	@echo "🔍 Analizando código..."
	flutter analyze

# Formatear código
format:
	@echo "✨ Formateando código..."
	dart format .

# Verificación completa (análisis + tests + cobertura)
verify: analyze format test-coverage
	@echo "✅ Verificación completa terminada"

# Comandos para desarrollo
dev-setup: setup
	@echo "🚀 Entorno de desarrollo listo"

# Correr la app
run:
	@echo "📱 Ejecutando la app..."
	flutter run

# Construir para release
build-release:
	@echo "🏗️  Construyendo para release..."
	flutter build apk --release

# Mostrar información del proyecto
info:
	@echo "ℹ️  Información del proyecto:"
	@echo "📱 Flutter: $(shell flutter --version | head -n 1)"
	@echo "🎯 Dart: $(shell dart --version | cut -d' ' -f4)"
	@echo "📊 Tests: $(shell find test -name "*.dart" | wc -l | tr -d ' ') archivos"
	@echo "🧪 Cobertura objetivo: 80%"