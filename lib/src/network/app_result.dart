/// Result type for network/API calls.
///
/// Replaces try-catch + throw pattern with sealed class
/// that forces consumer to handle both cases (Ok / Err).
///
/// ```dart
/// final result = await ref.read(authRepoProvider).login(...);
/// switch (result) {
///   case Ok(:final data):
///     // success, data is AuthResponse
///   case Err(:final failure):
///     // failure.type tells why
/// }
/// ```
sealed class AppResult<T> {
  const AppResult();
}

/// Success result.
final class Ok<T> extends AppResult<T> {
  final T data;
  const Ok(this.data);
}

/// Failure result.
final class Err<T> extends AppResult<T> {
  final AppFailure failure;
  const Err(this.failure);
}

/// Semantic failure type.
enum FailureType {
  /// No connection / timeout.
  network,

  /// 401 — token expired or invalid.
  unauthorized,

  /// 403 — no permission.
  forbidden,

  /// 404 — resource not found.
  notFound,

  /// 422 — validation error from backend.
  validation,

  /// 5xx — server error.
  server,

  /// Unexpected error / parsing.
  unknown,
}

/// Failure payload.
class AppFailure {
  final FailureType type;
  final String message;

  /// Per-field validation messages (for 422).
  final Map<String, String>? fieldErrors;

  /// Original HTTP status code (if any).
  final int? statusCode;

  const AppFailure({
    required this.type,
    required this.message,
    this.fieldErrors,
    this.statusCode,
  });

  @override
  String toString() => 'AppFailure($type, $message)';
}
