// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CashController)
final cashControllerProvider = CashControllerProvider._();

final class CashControllerProvider
    extends $NotifierProvider<CashController, List<CashModel>> {
  CashControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cashControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cashControllerHash();

  @$internal
  @override
  CashController create() => CashController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CashModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CashModel>>(value),
    );
  }
}

String _$cashControllerHash() => r'a2ef326e2e525f7ecf35bcb2cec9df6ae25fffe1';

abstract class _$CashController extends $Notifier<List<CashModel>> {
  List<CashModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<CashModel>, List<CashModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<CashModel>, List<CashModel>>,
              List<CashModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
