/// Common formatters for data display.
class Formatters {
  /// Format a number with thousand separators.
  static String number(num amount) => _formatNumber(amount);

  /// Format currency to IDR.
  static String currency(num amount, {String symbol = 'Rp '}) {
    return '$symbol${_formatNumber(amount)}';
  }

  /// Format number with thousand separator.
  static String _formatNumber(num n) {
    final parts = n.toString().split('.');
    final intPart = parts[0];
    final decPart = parts.length > 1 ? '.${parts[1]}' : '';

    final buffer = StringBuffer();
    int count = 0;
    for (int i = intPart.length - 1; i >= 0; i--) {
      if (count > 0 && count % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(intPart[i]);
      count++;
    }
    final reversed = buffer.toString().split('').reversed.join();
    return '$reversed$decPart';
  }

  /// Format date to Indonesian format (DD MMMM YYYY).
  static String dateId(DateTime date) {
    const months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  /// Format date to short Indonesian format (DD/MM/YYYY).
  static String dateShort(DateTime date) {
    final d = date.day.toString().padLeft(2, '0');
    final m = date.month.toString().padLeft(2, '0');
    return '$d/$m/${date.year}';
  }

  /// Format time to HH:MM.
  static String time(DateTime date) {
    final h = date.hour.toString().padLeft(2, '0');
    final m = date.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  /// Format phone number for display (e.g. +62 812-3456-7890).
  static String phone(String phone) {
    String p = phone.replaceAll(RegExp(r'[\s-]'), '');
    if (p.startsWith('62')) {
      p = '+$p';
    } else if (p.startsWith('0')) {
      p = '+62${p.substring(1)}';
    }
    // Insert dashes
    final regex = RegExp(r'(\d{3,4})(\d{3,4})(\d{3,4})');
    final match = regex.firstMatch(p.substring(p.startsWith('+') ? 3 : 0));
    if (match != null) {
      final prefix = p.startsWith('+62') ? '+62 ' : '';
      return '$prefix${match.group(1)}-${match.group(2)}-${match.group(3)}';
    }
    return p;
  }

  /// Truncate text with ellipsis.
  static String truncate(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// Capitalize first letter.
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return '${text[0].toUpperCase()}${text.substring(1)}';
  }
}
