// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_accounts_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BankAccountsController)
final bankAccountsControllerProvider = BankAccountsControllerProvider._();

final class BankAccountsControllerProvider
    extends $NotifierProvider<BankAccountsController, List<BankAccountsModel>> {
  BankAccountsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bankAccountsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bankAccountsControllerHash();

  @$internal
  @override
  BankAccountsController create() => BankAccountsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<BankAccountsModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<BankAccountsModel>>(value),
    );
  }
}

String _$bankAccountsControllerHash() =>
    r'91a80dda470d0f894690488c3bf17bfd7d264f73';

abstract class _$BankAccountsController
    extends $Notifier<List<BankAccountsModel>> {
  List<BankAccountsModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<List<BankAccountsModel>, List<BankAccountsModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<BankAccountsModel>, List<BankAccountsModel>>,
              List<BankAccountsModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
