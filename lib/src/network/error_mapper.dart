import 'package:dio/dio.dart';

import 'package:moe_flutter_core/src/network/app_result.dart';

/// Maps DioException to AppFailure.
///
/// Centralized error mapping — all API calls get consistent failure types.
AppFailure mapDioErrorToFailure(DioException err) {
  // Network / timeout
  if (err.type == DioExceptionType.connectionTimeout ||
      err.type == DioExceptionType.receiveTimeout ||
      err.type == DioExceptionType.sendTimeout ||
      err.type == DioExceptionType.connectionError) {
    return const AppFailure(
      type: FailureType.network,
      message: 'Koneksi bermasalah. Periksa internet Anda.',
    );
  }

  final statusCode = err.response?.statusCode ?? 0;

  switch (statusCode) {
    case 401:
      return const AppFailure(
        type: FailureType.unauthorized,
        message: 'Sesi habis. Silakan login kembali.',
      );
    case 403:
      return const AppFailure(
        type: FailureType.forbidden,
        message: 'Anda tidak memiliki izin untuk akses ini.',
      );
    case 404:
      return const AppFailure(
        type: FailureType.notFound,
        message: 'Resource tidak ditemukan.',
      );
    case 422:
      final errors = <String, String>{};
      final data = err.response?.data;
      if (data is Map<String, dynamic>) {
        final serverErrors = data['errors'];
        if (serverErrors is Map<String, dynamic>) {
          serverErrors.forEach((key, value) {
            if (value is List && value.isNotEmpty) {
              errors[key] = value.first.toString();
            }
          });
        }
      }
      return AppFailure(
        type: FailureType.validation,
        message: 'Validasi gagal.',
        fieldErrors: errors,
        statusCode: 422,
      );
    case >= 500:
      return const AppFailure(
        type: FailureType.server,
        message: 'Server bermasalah. Coba lagi nanti.',
      );
    default:
      return AppFailure(
        type: FailureType.unknown,
        message: err.message ?? 'Terjadi kesalahan tidak terduga.',
        statusCode: statusCode,
      );
  }
}
