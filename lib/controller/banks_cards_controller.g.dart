// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banks_cards_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BanksCardsSwitchController)
final banksCardsSwitchControllerProvider =
    BanksCardsSwitchControllerProvider._();

final class BanksCardsSwitchControllerProvider
    extends $NotifierProvider<BanksCardsSwitchController, bool> {
  BanksCardsSwitchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'banksCardsSwitchControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$banksCardsSwitchControllerHash();

  @$internal
  @override
  BanksCardsSwitchController create() => BanksCardsSwitchController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$banksCardsSwitchControllerHash() =>
    r'4a15599c51980b5796920c98163511cbe53ec26f';

abstract class _$BanksCardsSwitchController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(BankCardsIndicatorController)
final bankCardsIndicatorControllerProvider =
    BankCardsIndicatorControllerProvider._();

final class BankCardsIndicatorControllerProvider
    extends $NotifierProvider<BankCardsIndicatorController, int> {
  BankCardsIndicatorControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bankCardsIndicatorControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bankCardsIndicatorControllerHash();

  @$internal
  @override
  BankCardsIndicatorController create() => BankCardsIndicatorController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$bankCardsIndicatorControllerHash() =>
    r'62c5c71f3fd38ab856fb3a5746c7e6c1209619d3';

abstract class _$BankCardsIndicatorController extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
