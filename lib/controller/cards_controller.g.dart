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

String _$cardsControllerHash() => r'b3fd6074072b3177232c9f50732b1639d856b9ac';

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
final cardSwitchControllerProvider = CardSwitchControllerFamily._();

final class CardSwitchControllerProvider
    extends $NotifierProvider<CardSwitchController, bool> {
  CardSwitchControllerProvider._({
    required CardSwitchControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'cardSwitchControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cardSwitchControllerHash();

  @override
  String toString() {
    return r'cardSwitchControllerProvider'
        ''
        '($argument)';
  }

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

  @override
  bool operator ==(Object other) {
    return other is CardSwitchControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cardSwitchControllerHash() =>
    r'ed636b2670ffa6bcf576f366b4a33c8821f5ff68';

final class CardSwitchControllerFamily extends $Family
    with $ClassFamilyOverride<CardSwitchController, bool, bool, bool, int> {
  CardSwitchControllerFamily._()
    : super(
        retry: null,
        name: r'cardSwitchControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CardSwitchControllerProvider call(int index) =>
      CardSwitchControllerProvider._(argument: index, from: this);

  @override
  String toString() => r'cardSwitchControllerProvider';
}

abstract class _$CardSwitchController extends $Notifier<bool> {
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
