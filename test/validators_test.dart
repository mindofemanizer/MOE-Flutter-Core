import 'package:flutter_test/flutter_test.dart';
import 'package:moe_flutter_core/moe_flutter_core.dart';

void main() {
  group('Validators.email', () {
    test('valid email returns null', () {
      expect(Validators.email('user@test.com'), isNull);
    });

    test('empty email returns error', () {
      expect(Validators.email(''), isNotNull);
    });

    test('invalid email returns error', () {
      expect(Validators.email('notanemail'), isNotNull);
    });
  });

  group('Validators.password', () {
    test('valid password returns null', () {
      expect(Validators.password('password123'), isNull);
    });

    test('short password returns error', () {
      expect(Validators.password('short'), isNotNull);
    });
  });

  group('Validators.phone', () {
    test('valid Indonesian phone returns null', () {
      expect(Validators.phone('081234567890'), isNull);
    });

    test('+62 format returns null', () {
      expect(Validators.phone('+6281234567890'), isNull);
    });

    test('invalid phone returns error', () {
      expect(Validators.phone('12345'), isNotNull);
    });
  });

  group('Validators.required', () {
    test('non-empty returns null', () {
      expect(Validators.required('value'), isNull);
    });

    test('empty returns error', () {
      expect(Validators.required(''), isNotNull);
    });
  });

  group('Validators.confirmPassword', () {
    test('matching passwords return null', () {
      expect(Validators.confirmPassword('pass123', 'pass123'), isNull);
    });

    test('mismatched passwords return error', () {
      expect(Validators.confirmPassword('pass123', 'pass456'), isNotNull);
    });
  });

  group('Validators.minLength', () {
    test('sufficient length returns null', () {
      expect(Validators.minLength('hello', 3), isNull);
    });

    test('insufficient length returns error', () {
      expect(Validators.minLength('hi', 5), isNotNull);
    });
  });
}
