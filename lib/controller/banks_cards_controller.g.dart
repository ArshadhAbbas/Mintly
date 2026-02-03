// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banks_cards_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BanksCardsSwitchController)
final banksCardsSwitchControllerProvider = BanksCardsSwitchControllerFamily._();

final class BanksCardsSwitchControllerProvider
    extends $NotifierProvider<BanksCardsSwitchController, bool> {
  BanksCardsSwitchControllerProvider._({
    required BanksCardsSwitchControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'banksCardsSwitchControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$banksCardsSwitchControllerHash();

  @override
  String toString() {
    return r'banksCardsSwitchControllerProvider'
        ''
        '($argument)';
  }

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

  @override
  bool operator ==(Object other) {
    return other is BanksCardsSwitchControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$banksCardsSwitchControllerHash() =>
    r'd66b25a60dd37b277b08fdfa7f12f9aa85913198';

final class BanksCardsSwitchControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          BanksCardsSwitchController,
          bool,
          bool,
          bool,
          int
        > {
  BanksCardsSwitchControllerFamily._()
    : super(
        retry: null,
        name: r'banksCardsSwitchControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BanksCardsSwitchControllerProvider call(int index) =>
      BanksCardsSwitchControllerProvider._(argument: index, from: this);

  @override
  String toString() => r'banksCardsSwitchControllerProvider';
}

abstract class _$BanksCardsSwitchController extends $Notifier<bool> {
  late final _$args = ref.$arg as int;
  int get index => _$args;

  bool build(int index);
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
    element.handleCreate(ref, () => build(_$args));
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
    r'd0a2170e28944b24d15b2fad7d091587d2665b36';

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
