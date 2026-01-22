// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_nav_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BottomNavController)
final bottomNavControllerProvider = BottomNavControllerProvider._();

final class BottomNavControllerProvider
    extends $NotifierProvider<BottomNavController, int> {
  BottomNavControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bottomNavControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bottomNavControllerHash();

  @$internal
  @override
  BottomNavController create() => BottomNavController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$bottomNavControllerHash() =>
    r'0da931d0f564f3274275a33a0a50e3dcfe654ff2';

abstract class _$BottomNavController extends $Notifier<int> {
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

@ProviderFor(bottomNavIndexController)
final bottomNavIndexControllerProvider = BottomNavIndexControllerProvider._();

final class BottomNavIndexControllerProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  BottomNavIndexControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bottomNavIndexControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bottomNavIndexControllerHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return bottomNavIndexController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$bottomNavIndexControllerHash() =>
    r'09565a4c77ecefbcd33dfaf121e326459e3f1f52';
