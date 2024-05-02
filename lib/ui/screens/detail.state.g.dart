// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DetailStateCWProxy {
  DetailState loading(bool loading);

  DetailState projet(ProjetEntity projet);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  DetailState call({
    bool? loading,
    ProjetEntity? projet,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDetailState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDetailState.copyWith.fieldName(...)`
class _$DetailStateCWProxyImpl implements _$DetailStateCWProxy {
  const _$DetailStateCWProxyImpl(this._value);

  final DetailState _value;

  @override
  DetailState loading(bool loading) => this(loading: loading);

  @override
  DetailState projet(ProjetEntity projet) => this(projet: projet);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  DetailState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? projet = const $CopyWithPlaceholder(),
  }) {
    return DetailState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      projet: projet == const $CopyWithPlaceholder() || projet == null
          ? _value.projet
          // ignore: cast_nullable_to_non_nullable
          : projet as ProjetEntity,
    );
  }
}

extension $DetailStateCopyWith on DetailState {
  /// Returns a callable class that can be used as follows: `instanceOfDetailState.copyWith(...)` or like so:`instanceOfDetailState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DetailStateCWProxy get copyWith => _$DetailStateCWProxyImpl(this);
}
