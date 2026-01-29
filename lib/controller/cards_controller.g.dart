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
