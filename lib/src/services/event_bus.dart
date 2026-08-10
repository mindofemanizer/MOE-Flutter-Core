import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Base class for all MOE events.
///
/// Modules communicate via events, not direct calls.
/// See STRATEGI_PACKAGE.md Pasal 4.3.
abstract class MoeEvent {
  const MoeEvent();
}

/// Generic event bus using Riverpod Notifier.
///
/// Usage:
/// ```dart
/// // emit
/// ref.read(moeEventBusProvider.notifier).emit(MyEvent());
///
/// // listen
/// ref.listen(moeEventBusProvider, (prev, event) {
///   if (event is MyEvent) { ... }
/// });
/// ```
class MoeEventBus extends Notifier<MoeEvent?> {
  @override
  MoeEvent? build() => null;

  void emit(MoeEvent event) {
    state = event;
  }
}

/// Global event bus provider — access from anywhere via `ref.read(moeEventBusProvider)`.
final moeEventBusProvider =
    NotifierProvider<MoeEventBus, MoeEvent?>(MoeEventBus.new);
