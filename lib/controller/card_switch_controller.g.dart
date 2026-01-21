// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_switch_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CardSwitchController)
final cardSwitchControllerProvider = CardSwitchControllerProvider._();

final class CardSwitchControllerProvider
    extends $NotifierProvider<CardSwitchController, bool> {
  CardSwitchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardSwitchControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardSwitchControllerHash();

  @$internal
  @override
  CardSwitchController create() => CardSwitchController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$cardSwitchControllerHash() =>
    r'4dfb6f1d6c33b5a916f772531eb927422f4968a9';

abstract class _$CardSwitchController extends $Notifier<bool> {
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

@ProviderFor(cardSwitchStateController)
final cardSwitchStateControllerProvider = CardSwitchStateControllerProvider._();

final class CardSwitchStateControllerProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  CardSwitchStateControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardSwitchStateControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardSwitchStateControllerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return cardSwitchStateController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$cardSwitchStateControllerHash() =>
    r'00838109df6dafcd3592216378b4e26920ad3b95';
