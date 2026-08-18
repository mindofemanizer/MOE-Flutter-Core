# MOE-Flutter-Core

Core package for MOE Flutter ecosystem â€” API client, theme, constants, utils, error handling, secure storage, event bus.

## Installation

```yaml
dependencies:
  moe_flutter_core:
    git:
      url: https://github.com/mindofemanizer/MOE-Flutter-Core.git
      ref: v1.0.0
```

## Usage

```dart
import 'package:moe_flutter_core/moe_flutter_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  MoeCore.setup(
    envConfig: EnvConfig.fromEnvironment(),
    environment: Environment.production,
  );
  runApp(const ProviderScope(child: MyApp()));
}
```

### Theme

```dart
MaterialApp(
  theme: MoeAppTheme.buildTheme(
    primaryColorHex: MoeCore.envConfig.primaryColorHex,
  ),
  darkTheme: MoeAppTheme.buildDarkTheme(
    primaryColorHex: MoeCore.envConfig.primaryColorHex,
  ),
);
```

### API Client

```dart
final dio = ref.watch(dioProvider);
final response = await dio.get('/users');
```

### AppResult

```dart
try {
  final response = await dio.post('/login', data: data);
  return Ok(AuthResponse.fromJson(response.data));
} on DioException catch (e) {
  return Err(mapDioErrorToFailure(e));
}
```

### Event Bus

```dart
// emit
ref.read(moeEventBusProvider.notifier).emit(MyEvent());

// listen
ref.listen(moeEventBusProvider, (prev, event) {
  if (event is MyEvent) { ... }
});
```

### Validators

```dart
TextFormField(
  validator: Validators.email,
);
```

### Formatters

```dart
Text(Formatters.currency(50000)); // Rp 50.000
Text(Formatters.dateId(DateTime.now())); // 10 Agustus 2026
```

## What's Included

| Module | Description |
|--------|-------------|
| `EnvConfig` | Environment config via `--dart-define` |
| `MoeCore` | Setup entry point |
| `DesignTokens` | Design system tokens |
| `MoeAppTheme` | Dynamic theme builder |
| `AppResult<T>` | Sealed result type (Ok/Err) |
| `AppFailure` | Semantic failure types |
| `dioProvider` | Dio instance provider |
| `TokenInterceptor` | Base auth interceptor |
| `SecureStorageService` | Secure storage wrapper |
| `MoeEventBus` | Cross-module event bus |
| `MoeException` | Exception hierarchy |
| `Validators` | Form validators |
| `Formatters` | Data formatters |
