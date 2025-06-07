import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server({required String message, required int code}) =
      ServerFailure;

  const factory Failure.network({required String message}) = NetworkFailure;

  const factory Failure.location({required String message}) = LocationFailure;

  const factory Failure.permission({required String message}) =
      PermissionFailure;

  const factory Failure.cache({required String message}) = CacheFailure;

  const factory Failure.unknown({required String message}) = UnknownFailure;
}

extension FailureX on Failure {
  String get userMessage {
    return when(
      server: (message, code) => 'Error del servidor: $message',
      network: (message) => 'Sin conexión a internet',
      location: (message) => 'Error de ubicación: $message',
      permission: (message) => 'Permisos requeridos: $message',
      cache: (message) => 'Error de almacenamiento: $message',
      unknown: (message) => 'Error desconocido: $message',
    );
  }
}
