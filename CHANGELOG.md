# Changelog

## 1.0.0 — 2026-08-10

### Added
- Initial release
- `EnvConfig` — environment configuration via `--dart-define`
- `MoeCore` — setup entry point for all MOE Flutter packages
- `DesignTokens` — design system tokens (colors, spacing, radius, motion)
- `MoeAppTheme` — dynamic theme builder with white-label support
- `AppResult<T>` — sealed class for network result (Ok/Err)
- `AppFailure` — semantic failure types (network, unauthorized, validation, etc.)
- `mapDioErrorToFailure` — centralized Dio error mapper
- `dioProvider` — Riverpod provider for Dio instance
- `TokenInterceptor` — base auth token interceptor
- `SecureStorageService` — generic secure storage wrapper
- `MoeEventBus` — Riverpod-based event bus for cross-module communication
- `MoeException` hierarchy — base + network, validation, auth, not found, server
- `Validators` — email, password, phone (ID), required, confirm password, min length
- `Formatters` — currency (IDR), date (ID), time, phone, truncate, capitalize
