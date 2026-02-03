// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedAccountsController)
final selectedAccountsControllerProvider =
    SelectedAccountsControllerProvider._();

final class SelectedAccountsControllerProvider
    extends $NotifierProvider<SelectedAccountsController, AccountType> {
  SelectedAccountsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedAccountsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedAccountsControllerHash();

  @$internal
  @override
  SelectedAccountsController create() => SelectedAccountsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccountType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccountType>(value),
    );
  }
}

String _$selectedAccountsControllerHash() =>
    r'9ced49828dea7703f29964fb6f621ebaea445799';

abstract class _$SelectedAccountsController extends $Notifier<AccountType> {
  AccountType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AccountType, AccountType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AccountType, AccountType>,
              AccountType,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
