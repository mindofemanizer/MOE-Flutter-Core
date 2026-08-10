import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moe_flutter_core/src/config/env_config.dart';
import 'package:moe_flutter_core/src/config/environment.dart';

/// Core configuration for MOE Flutter ecosystem.
///
/// Must be called in `main()` before `runApp()`:
///
/// ```dart
/// void main() {
///   MoeCore.setup(
///     envConfig: EnvConfig.fromEnvironment(),
///     environment: Environment.production,
///   );
///   runApp(const ProviderScope(child: MyApp()));
/// }
/// ```
class MoeCore {
  static late EnvConfig _envConfig;
  static late Environment _environment;

  static void setup({
    required EnvConfig envConfig,
    Environment environment = Environment.development,
  }) {
    _envConfig = envConfig;
    _environment = environment;
  }

  static EnvConfig get envConfig => _envConfig;
  static Environment get environment => _environment;
  static String get apiUrl => _envConfig.apiBaseUrl;
  static String get appName => _envConfig.appName;
}

/// Provider for accessing MoeCore config from Riverpod.
final moeCoreConfigProvider = Provider<MoeCoreConfig>((ref) {
  return MoeCoreConfig(
    envConfig: MoeCore.envConfig,
    environment: MoeCore.environment,
  );
});

class MoeCoreConfig {
  final EnvConfig envConfig;
  final Environment environment;

  const MoeCoreConfig({
    required this.envConfig,
    required this.environment,
  });
}
