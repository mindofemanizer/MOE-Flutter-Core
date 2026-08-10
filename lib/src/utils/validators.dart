/// Common validators for form inputs.
class Validators {
  /// Email validation.
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Email wajib diisi';
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}$');
    if (!regex.hasMatch(value)) return 'Format email tidak valid';
    return null;
  }

  /// Password validation (min 8 chars).
  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password wajib diisi';
    if (value.length < 8) return 'Password minimal 8 karakter';
    return null;
  }

  /// Required field validation.
  static String? required(String? value, {String label = 'Field ini'}) {
    if (value == null || value.isEmpty) return '$label wajib diisi';
    return null;
  }

  /// Phone number validation (Indonesian format).
  static String? phone(String? value) {
    if (value == null || value.isEmpty) return 'Nomor HP wajib diisi';
    final regex = RegExp(r'^(\+62|62|0)8[1-9]\d{6,11}$');
    if (!regex.hasMatch(value)) return 'Format nomor HP tidak valid';
    return null;
  }

  /// Confirm password match validation.
  static String? confirmPassword(String? value, String original) {
    if (value == null || value.isEmpty) return 'Konfirmasi password wajib diisi';
    if (value != original) return 'Password tidak cocok';
    return null;
  }

  /// Minimum length validation.
  static String? minLength(String? value, int min, {String label = 'Field ini'}) {
    if (value == null || value.isEmpty) return '$label wajib diisi';
    if (value.length < min) return '$label minimal $min karakter';
    return null;
  }
}
