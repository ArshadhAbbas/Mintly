// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_contoller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoriesController)
final categoriesControllerProvider = CategoriesControllerProvider._();

final class CategoriesControllerProvider
    extends
        $AsyncNotifierProvider<CategoriesController, List<CategoriesModel>> {
  CategoriesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesControllerHash();

  @$internal
  @override
  CategoriesController create() => CategoriesController();
}

String _$categoriesControllerHash() =>
    r'0c335aa38ba4303903d6a3e80c9446295606a02b';

abstract class _$CategoriesController
    extends $AsyncNotifier<List<CategoriesModel>> {
  FutureOr<List<CategoriesModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<CategoriesModel>>, List<CategoriesModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<CategoriesModel>>,
                List<CategoriesModel>
              >,
              AsyncValue<List<CategoriesModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(seedCategoriesIfNeeded)
final seedCategoriesIfNeededProvider = SeedCategoriesIfNeededProvider._();

final class SeedCategoriesIfNeededProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  SeedCategoriesIfNeededProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'seedCategoriesIfNeededProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$seedCategoriesIfNeededHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return seedCategoriesIfNeeded(ref);
  }
}

String _$seedCategoriesIfNeededHash() =>
    r'c0434addcc85f921291414a2e3a2dc63142c9ba6';

@ProviderFor(SelectedCategoryIconController)
final selectedCategoryIconControllerProvider =
    SelectedCategoryIconControllerProvider._();

final class SelectedCategoryIconControllerProvider
    extends $NotifierProvider<SelectedCategoryIconController, String> {
  SelectedCategoryIconControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCategoryIconControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCategoryIconControllerHash();

  @$internal
  @override
  SelectedCategoryIconController create() => SelectedCategoryIconController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$selectedCategoryIconControllerHash() =>
    r'9dfffeb428f6a36f6e858adf6e4b7bdfe9547830';

abstract class _$SelectedCategoryIconController extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
