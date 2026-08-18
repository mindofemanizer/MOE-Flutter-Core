import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moe_flutter_core/src/config/moe_core.dart';
import 'package:moe_flutter_core/src/constants/design_tokens.dart';
import 'package:moe_flutter_core/src/services/secure_storage_service.dart';

/// Base interceptor for auth token injection.
///
/// Auth package extends this with token-specific logic.
/// This base class handles:
/// - Injecting `Accept: application/json` header
/// - Injecting `Authorization: Bearer {token}` if token exists
/// - 401 handling via event bus (delegated to auth package)
class TokenInterceptor extends Interceptor {
  final SecureStorageService _storage;
  final String _tokenKey;

  TokenInterceptor(this._storage, this._tokenKey);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Accept'] = 'application/json';

    final token = await _storage.read(_tokenKey);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}

/// Provider for Dio instance.
///
/// Auth package adds its own interceptor on top of this.
final dioProvider = Provider<Dio>((ref) {
  final envConfig = MoeCore.envConfig;

  final dio = Dio(
    BaseOptions(
      baseUrl: envConfig.apiBaseUrl,
      connectTimeout: DesignTokens.connectTimeout,
      receiveTimeout: DesignTokens.receiveTimeout,
    ),
  );

  return dio;
});
