// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedAccountChipController)
final selectedAccountChipControllerProvider =
    SelectedAccountChipControllerProvider._();

final class SelectedAccountChipControllerProvider
    extends $NotifierProvider<SelectedAccountChipController, AccountType?> {
  SelectedAccountChipControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedAccountChipControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedAccountChipControllerHash();

  @$internal
  @override
  SelectedAccountChipController create() => SelectedAccountChipController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccountType? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccountType?>(value),
    );
  }
}

String _$selectedAccountChipControllerHash() =>
    r'bbae08e4d750ea1c456d9f05ae30d93eef3dad62';

abstract class _$SelectedAccountChipController extends $Notifier<AccountType?> {
  AccountType? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AccountType?, AccountType?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AccountType?, AccountType?>,
              AccountType?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedAccountOrCardNumber)
final selectedAccountOrCardNumberProvider =
    SelectedAccountOrCardNumberProvider._();

final class SelectedAccountOrCardNumberProvider
    extends $NotifierProvider<SelectedAccountOrCardNumber, String?> {
  SelectedAccountOrCardNumberProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedAccountOrCardNumberProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedAccountOrCardNumberHash();

  @$internal
  @override
  SelectedAccountOrCardNumber create() => SelectedAccountOrCardNumber();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$selectedAccountOrCardNumberHash() =>
    r'2b57a14aaff4147b3472f8866590d6b664c2fdf0';

abstract class _$SelectedAccountOrCardNumber extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedTransactionCategory)
final selectedTransactionCategoryProvider =
    SelectedTransactionCategoryProvider._();

final class SelectedTransactionCategoryProvider
    extends $NotifierProvider<SelectedTransactionCategory, CategoriesModel?> {
  SelectedTransactionCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedTransactionCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedTransactionCategoryHash();

  @$internal
  @override
  SelectedTransactionCategory create() => SelectedTransactionCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoriesModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoriesModel?>(value),
    );
  }
}

String _$selectedTransactionCategoryHash() =>
    r'0db8219aad22ab8124f5f1fa2898cea948575f24';

abstract class _$SelectedTransactionCategory
    extends $Notifier<CategoriesModel?> {
  CategoriesModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CategoriesModel?, CategoriesModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CategoriesModel?, CategoriesModel?>,
              CategoriesModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedTransactionSubCategory)
final selectedTransactionSubCategoryProvider =
    SelectedTransactionSubCategoryProvider._();

final class SelectedTransactionSubCategoryProvider
    extends
        $NotifierProvider<SelectedTransactionSubCategory, CategoriesModel?> {
  SelectedTransactionSubCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedTransactionSubCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedTransactionSubCategoryHash();

  @$internal
  @override
  SelectedTransactionSubCategory create() => SelectedTransactionSubCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoriesModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoriesModel?>(value),
    );
  }
}

String _$selectedTransactionSubCategoryHash() =>
    r'c38f33a507710513c45f924542396090e332aa04';

abstract class _$SelectedTransactionSubCategory
    extends $Notifier<CategoriesModel?> {
  CategoriesModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CategoriesModel?, CategoriesModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CategoriesModel?, CategoriesModel?>,
              CategoriesModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
