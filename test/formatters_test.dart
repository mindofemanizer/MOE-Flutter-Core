import 'package:flutter_test/flutter_test.dart';
import 'package:moe_flutter_core/moe_flutter_core.dart';

void main() {
  group('Formatters.currency', () {
    test('formats integer amount', () {
      expect(Formatters.currency(50000), equals('Rp 50.000'));
    });

    test('formats large amount', () {
      expect(Formatters.currency(1500000), equals('Rp 1.500.000'));
    });

    test('formats with custom symbol', () {
      expect(Formatters.currency(100, symbol: ''), equals('100'));
    });
  });

  group('Formatters.dateId', () {
    test('formats date in Indonesian', () {
      final date = DateTime(2026, 8, 10);
      expect(Formatters.dateId(date), equals('10 Agustus 2026'));
    });
  });

  group('Formatters.dateShort', () {
    test('formats date DD/MM/YYYY', () {
      final date = DateTime(2026, 1, 5);
      expect(Formatters.dateShort(date), equals('05/01/2026'));
    });
  });

  group('Formatters.time', () {
    test('formats time HH:MM', () {
      final date = DateTime(2026, 1, 1, 9, 5);
      expect(Formatters.time(date), equals('09:05'));
    });
  });

  group('Formatters.truncate', () {
    test('short text unchanged', () {
      expect(Formatters.truncate('hello', 10), equals('hello'));
    });

    test('long text truncated with ellipsis', () {
      expect(Formatters.truncate('hello world', 5), equals('hello...'));
    });
  });

  group('Formatters.capitalize', () {
    test('capitalizes first letter', () {
      expect(Formatters.capitalize('hello'), equals('Hello'));
    });

    test('empty string unchanged', () {
      expect(Formatters.capitalize(''), equals(''));
    });
  });
}
