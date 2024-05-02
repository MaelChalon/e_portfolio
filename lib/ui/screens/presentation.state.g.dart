// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentation.state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PresentationStateCWProxy {
  PresentationState loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PresentationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PresentationState(...).copyWith(id: 12, name: "My name")
  /// ````
  PresentationState call({
    bool? loading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPresentationState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPresentationState.copyWith.fieldName(...)`
class _$PresentationStateCWProxyImpl implements _$PresentationStateCWProxy {
  const _$PresentationStateCWProxyImpl(this._value);

  final PresentationState _value;

  @override
  PresentationState loading(bool loading) => this(loading: loading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PresentationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PresentationState(...).copyWith(id: 12, name: "My name")
  /// ````
  PresentationState call({
    Object? loading = const $CopyWithPlaceholder(),
  }) {
    return PresentationState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
    );
  }
}

extension $PresentationStateCopyWith on PresentationState {
  /// Returns a callable class that can be used as follows: `instanceOfPresentationState.copyWith(...)` or like so:`instanceOfPresentationState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PresentationStateCWProxy get copyWith =>
      _$PresentationStateCWProxyImpl(this);
}
