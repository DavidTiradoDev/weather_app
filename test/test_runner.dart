// Script para ejecutar todos los tests y generar reportes de cobertura

import 'dart:io';

void main() async {
  print('🧪 Iniciando tests unitarios...\n');

  // Ejecuta todos los tests
  await runTests();

  // Reporte de cobertura
  await generateCoverageReport();

  print('\nTests completados!');
}

Future<void> runTests() async {
  print('Ejecutando tests unitarios...');

  final result = await Process.run('flutter', [
    'test',
    '--coverage',
  ], runInShell: true);

  if (result.exitCode == 0) {
    print('Todos los tests pasaron');
    print(result.stdout);
  } else {
    print('Algunos tests fallaron');
    print(result.stderr);
    exit(result.exitCode);
  }
}

Future<void> generateCoverageReport() async {
  print('\nGenerando reporte de cobertura...');

  // Instalar lcov si no está disponible
  await Process.run('which', ['lcov'], runInShell: true).then((result) {
    if (result.exitCode != 0) {
      print(
        'lcov no está instalado. Instálalo con: brew install lcov (macOS) o apt-get install lcov (Linux)',
      );
      return;
    }
  });

  // Generar reporte HTML
  final result = await Process.run('genhtml', [
    'coverage/lcov.info',
    '-o',
    'coverage/html',
  ], runInShell: true);

  if (result.exitCode == 0) {
    print('Reporte de cobertura generado en coverage/html/index.html');
  } else {
    print('No se pudo generar el reporte de cobertura');
  }
}
