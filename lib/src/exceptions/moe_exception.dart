/// Base exception for all MOE Flutter packages.
///
/// All package-specific exceptions extend this.
class MoeException implements Exception {
  final String message;
  final String? code;

  const MoeException(this.message, {this.code});

  @override
  String toString() => 'MoeException($code): $message';
}

/// Network-related exception.
class NetworkException extends MoeException {
  const NetworkException(super.message, {super.code});
}

/// Validation exception.
class ValidationException extends MoeException {
  final Map<String, String> fieldErrors;

  const ValidationException(super.message, {required this.fieldErrors, super.code});
}

/// Authentication exception.
class AuthException extends MoeException {
  const AuthException(super.message, {super.code});
}

/// Not found exception.
class NotFoundException extends MoeException {
  const NotFoundException(super.message, {super.code});
}

/// Server exception.
class ServerException extends MoeException {
  final int? statusCode;

  const ServerException(super.message, {this.statusCode, super.code});
}
