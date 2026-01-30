// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CardsController)
final cardsControllerProvider = CardsControllerProvider._();

final class CardsControllerProvider
    extends $NotifierProvider<CardsController, List<CardModel>> {
  CardsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardsControllerHash();

  @$internal
  @override
  CardsController create() => CardsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CardModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CardModel>>(value),
    );
  }
}

String _$cardsControllerHash() => r'4b499956f1eb3a198d45330d3a837fd8deddb63a';

abstract class _$CardsController extends $Notifier<List<CardModel>> {
  List<CardModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<CardModel>, List<CardModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<CardModel>, List<CardModel>>,
              List<CardModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

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

@ProviderFor(CardIndicatorController)
final cardIndicatorControllerProvider = CardIndicatorControllerProvider._();

final class CardIndicatorControllerProvider
    extends $NotifierProvider<CardIndicatorController, int> {
  CardIndicatorControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardIndicatorControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardIndicatorControllerHash();

  @$internal
  @override
  CardIndicatorController create() => CardIndicatorController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cardIndicatorControllerHash() =>
    r'4cffd4c5480d2fc638fefd6d14f24b46bb315f86';

abstract class _$CardIndicatorController extends $Notifier<int> {
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

@ProviderFor(cardIndicatorStateController)
final cardIndicatorStateControllerProvider =
    CardIndicatorStateControllerProvider._();

final class CardIndicatorStateControllerProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  CardIndicatorStateControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardIndicatorStateControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardIndicatorStateControllerHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return cardIndicatorStateController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cardIndicatorStateControllerHash() =>
    r'531b88285fc13cab4c95ab110d17555e260f2062';
