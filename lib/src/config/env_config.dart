/// Environment configuration for white-label builds.
///
/// Values injected via `--dart-define` at build/run:
///
/// ```bash
/// flutter run \
///   --dart-define=APP_NAME="HaloSapa" \
///   --dart-define=API_BASE_URL="https://api.halosapa.com/api/v1" \
///   --dart-define=PRIMARY_COLOR="#006c49"
/// ```
///
/// Or via file:
/// ```bash
/// flutter run --dart-define-from-file=flavors/halosapa.json
/// ```
class EnvConfig {
  final String appName;
  final String apiBaseUrl;
  final String primaryColorHex;

  const EnvConfig({
    required this.appName,
    required this.apiBaseUrl,
    this.primaryColorHex = '#006c49',
  });

  /// Read config from `--dart-define` with safe fallback.
  factory EnvConfig.fromEnvironment() {
    return const EnvConfig(
      appName: String.fromEnvironment(
        'APP_NAME',
        defaultValue: 'MOE App',
      ),
      apiBaseUrl: String.fromEnvironment(
        'API_BASE_URL',
        defaultValue: 'http://localhost:8000/api/v1',
      ),
      primaryColorHex: String.fromEnvironment('PRIMARY_COLOR'),
    );
  }
}
