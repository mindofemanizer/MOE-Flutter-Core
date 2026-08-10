import 'package:flutter_test/flutter_test.dart';
import 'package:moe_flutter_core/moe_flutter_core.dart';

void main() {
  group('AppResult', () {
    test('Ok holds data', () {
      const result = Ok<String>('hello');
      expect(result.data, equals('hello'));
    });

    test('Err holds failure', () {
      const result = Err<String>(
        AppFailure(type: FailureType.network, message: 'No connection'),
      );
      expect(result.failure.type, equals(FailureType.network));
      expect(result.failure.message, equals('No connection'));
    });
  });

  group('AppFailure', () {
    test('toString contains type and message', () {
      const failure = AppFailure(
        type: FailureType.server,
        message: 'Internal error',
        statusCode: 500,
      );
      expect(failure.toString(), contains('server'));
      expect(failure.toString(), contains('Internal error'));
      expect(failure.statusCode, equals(500));
    });

    test('validation failure has fieldErrors', () {
      const failure = AppFailure(
        type: FailureType.validation,
        message: 'Invalid',
        fieldErrors: {'email': 'Email required'},
      );
      expect(failure.fieldErrors, isNotNull);
      expect(failure.fieldErrors!['email'], equals('Email required'));
    });
  });
}
