// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AsyncData<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T? data) loading,
    required TResult Function(T data) success,
    required TResult Function(dynamic e) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T? data)? loading,
    TResult? Function(T data)? success,
    TResult? Function(dynamic e)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T? data)? loading,
    TResult Function(T data)? success,
    TResult Function(dynamic e)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncInitial<T> value) initial,
    required TResult Function(AsyncLoading<T> value) loading,
    required TResult Function(AsyncSuccess<T> value) success,
    required TResult Function(AsyncFail<T> value) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncInitial<T> value)? initial,
    TResult? Function(AsyncLoading<T> value)? loading,
    TResult? Function(AsyncSuccess<T> value)? success,
    TResult? Function(AsyncFail<T> value)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncInitial<T> value)? initial,
    TResult Function(AsyncLoading<T> value)? loading,
    TResult Function(AsyncSuccess<T> value)? success,
    TResult Function(AsyncFail<T> value)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncDataCopyWith<T, $Res> {
  factory $AsyncDataCopyWith(
          AsyncData<T> value, $Res Function(AsyncData<T>) then) =
      _$AsyncDataCopyWithImpl<T, $Res, AsyncData<T>>;
}

/// @nodoc
class _$AsyncDataCopyWithImpl<T, $Res, $Val extends AsyncData<T>>
    implements $AsyncDataCopyWith<T, $Res> {
  _$AsyncDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AsyncInitialImplCopyWith<T, $Res> {
  factory _$$AsyncInitialImplCopyWith(_$AsyncInitialImpl<T> value,
          $Res Function(_$AsyncInitialImpl<T>) then) =
      __$$AsyncInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AsyncInitialImplCopyWithImpl<T, $Res>
    extends _$AsyncDataCopyWithImpl<T, $Res, _$AsyncInitialImpl<T>>
    implements _$$AsyncInitialImplCopyWith<T, $Res> {
  __$$AsyncInitialImplCopyWithImpl(
      _$AsyncInitialImpl<T> _value, $Res Function(_$AsyncInitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AsyncInitialImpl<T> extends AsyncInitial<T>
    with DiagnosticableTreeMixin {
  const _$AsyncInitialImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AsyncData<$T>.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AsyncData<$T>.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AsyncInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T? data) loading,
    required TResult Function(T data) success,
    required TResult Function(dynamic e) fail,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T? data)? loading,
    TResult? Function(T data)? success,
    TResult? Function(dynamic e)? fail,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T? data)? loading,
    TResult Function(T data)? success,
    TResult Function(dynamic e)? fail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncInitial<T> value) initial,
    required TResult Function(AsyncLoading<T> value) loading,
    required TResult Function(AsyncSuccess<T> value) success,
    required TResult Function(AsyncFail<T> value) fail,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncInitial<T> value)? initial,
    TResult? Function(AsyncLoading<T> value)? loading,
    TResult? Function(AsyncSuccess<T> value)? success,
    TResult? Function(AsyncFail<T> value)? fail,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncInitial<T> value)? initial,
    TResult Function(AsyncLoading<T> value)? loading,
    TResult Function(AsyncSuccess<T> value)? success,
    TResult Function(AsyncFail<T> value)? fail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AsyncInitial<T> extends AsyncData<T> {
  const factory AsyncInitial() = _$AsyncInitialImpl<T>;
  const AsyncInitial._() : super._();
}

/// @nodoc
abstract class _$$AsyncLoadingImplCopyWith<T, $Res> {
  factory _$$AsyncLoadingImplCopyWith(_$AsyncLoadingImpl<T> value,
          $Res Function(_$AsyncLoadingImpl<T>) then) =
      __$$AsyncLoadingImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$AsyncLoadingImplCopyWithImpl<T, $Res>
    extends _$AsyncDataCopyWithImpl<T, $Res, _$AsyncLoadingImpl<T>>
    implements _$$AsyncLoadingImplCopyWith<T, $Res> {
  __$$AsyncLoadingImplCopyWithImpl(
      _$AsyncLoadingImpl<T> _value, $Res Function(_$AsyncLoadingImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AsyncLoadingImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$AsyncLoadingImpl<T> extends AsyncLoading<T>
    with DiagnosticableTreeMixin {
  const _$AsyncLoadingImpl([this.data]) : super._();

  @override
  final T? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AsyncData<$T>.loading(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AsyncData<$T>.loading'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsyncLoadingImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AsyncLoadingImplCopyWith<T, _$AsyncLoadingImpl<T>> get copyWith =>
      __$$AsyncLoadingImplCopyWithImpl<T, _$AsyncLoadingImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T? data) loading,
    required TResult Function(T data) success,
    required TResult Function(dynamic e) fail,
  }) {
    return loading(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T? data)? loading,
    TResult? Function(T data)? success,
    TResult? Function(dynamic e)? fail,
  }) {
    return loading?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T? data)? loading,
    TResult Function(T data)? success,
    TResult Function(dynamic e)? fail,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncInitial<T> value) initial,
    required TResult Function(AsyncLoading<T> value) loading,
    required TResult Function(AsyncSuccess<T> value) success,
    required TResult Function(AsyncFail<T> value) fail,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncInitial<T> value)? initial,
    TResult? Function(AsyncLoading<T> value)? loading,
    TResult? Function(AsyncSuccess<T> value)? success,
    TResult? Function(AsyncFail<T> value)? fail,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncInitial<T> value)? initial,
    TResult Function(AsyncLoading<T> value)? loading,
    TResult Function(AsyncSuccess<T> value)? success,
    TResult Function(AsyncFail<T> value)? fail,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AsyncLoading<T> extends AsyncData<T> {
  const factory AsyncLoading([final T? data]) = _$AsyncLoadingImpl<T>;
  const AsyncLoading._() : super._();

  T? get data;
  @JsonKey(ignore: true)
  _$$AsyncLoadingImplCopyWith<T, _$AsyncLoadingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AsyncSuccessImplCopyWith<T, $Res> {
  factory _$$AsyncSuccessImplCopyWith(_$AsyncSuccessImpl<T> value,
          $Res Function(_$AsyncSuccessImpl<T>) then) =
      __$$AsyncSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$AsyncSuccessImplCopyWithImpl<T, $Res>
    extends _$AsyncDataCopyWithImpl<T, $Res, _$AsyncSuccessImpl<T>>
    implements _$$AsyncSuccessImplCopyWith<T, $Res> {
  __$$AsyncSuccessImplCopyWithImpl(
      _$AsyncSuccessImpl<T> _value, $Res Function(_$AsyncSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AsyncSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$AsyncSuccessImpl<T> extends AsyncSuccess<T>
    with DiagnosticableTreeMixin {
  const _$AsyncSuccessImpl(this.data) : super._();

  @override
  final T data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AsyncData<$T>.success(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AsyncData<$T>.success'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsyncSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AsyncSuccessImplCopyWith<T, _$AsyncSuccessImpl<T>> get copyWith =>
      __$$AsyncSuccessImplCopyWithImpl<T, _$AsyncSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T? data) loading,
    required TResult Function(T data) success,
    required TResult Function(dynamic e) fail,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T? data)? loading,
    TResult? Function(T data)? success,
    TResult? Function(dynamic e)? fail,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T? data)? loading,
    TResult Function(T data)? success,
    TResult Function(dynamic e)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncInitial<T> value) initial,
    required TResult Function(AsyncLoading<T> value) loading,
    required TResult Function(AsyncSuccess<T> value) success,
    required TResult Function(AsyncFail<T> value) fail,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncInitial<T> value)? initial,
    TResult? Function(AsyncLoading<T> value)? loading,
    TResult? Function(AsyncSuccess<T> value)? success,
    TResult? Function(AsyncFail<T> value)? fail,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncInitial<T> value)? initial,
    TResult Function(AsyncLoading<T> value)? loading,
    TResult Function(AsyncSuccess<T> value)? success,
    TResult Function(AsyncFail<T> value)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AsyncSuccess<T> extends AsyncData<T> {
  const factory AsyncSuccess(final T data) = _$AsyncSuccessImpl<T>;
  const AsyncSuccess._() : super._();

  T get data;
  @JsonKey(ignore: true)
  _$$AsyncSuccessImplCopyWith<T, _$AsyncSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AsyncFailImplCopyWith<T, $Res> {
  factory _$$AsyncFailImplCopyWith(
          _$AsyncFailImpl<T> value, $Res Function(_$AsyncFailImpl<T>) then) =
      __$$AsyncFailImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({dynamic e});
}

/// @nodoc
class __$$AsyncFailImplCopyWithImpl<T, $Res>
    extends _$AsyncDataCopyWithImpl<T, $Res, _$AsyncFailImpl<T>>
    implements _$$AsyncFailImplCopyWith<T, $Res> {
  __$$AsyncFailImplCopyWithImpl(
      _$AsyncFailImpl<T> _value, $Res Function(_$AsyncFailImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$AsyncFailImpl<T>(
      freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$AsyncFailImpl<T> extends AsyncFail<T> with DiagnosticableTreeMixin {
  const _$AsyncFailImpl(this.e) : super._();

  @override
  final dynamic e;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AsyncData<$T>.fail(e: $e)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AsyncData<$T>.fail'))
      ..add(DiagnosticsProperty('e', e));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsyncFailImpl<T> &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AsyncFailImplCopyWith<T, _$AsyncFailImpl<T>> get copyWith =>
      __$$AsyncFailImplCopyWithImpl<T, _$AsyncFailImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(T? data) loading,
    required TResult Function(T data) success,
    required TResult Function(dynamic e) fail,
  }) {
    return fail(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(T? data)? loading,
    TResult? Function(T data)? success,
    TResult? Function(dynamic e)? fail,
  }) {
    return fail?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(T? data)? loading,
    TResult Function(T data)? success,
    TResult Function(dynamic e)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AsyncInitial<T> value) initial,
    required TResult Function(AsyncLoading<T> value) loading,
    required TResult Function(AsyncSuccess<T> value) success,
    required TResult Function(AsyncFail<T> value) fail,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AsyncInitial<T> value)? initial,
    TResult? Function(AsyncLoading<T> value)? loading,
    TResult? Function(AsyncSuccess<T> value)? success,
    TResult? Function(AsyncFail<T> value)? fail,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AsyncInitial<T> value)? initial,
    TResult Function(AsyncLoading<T> value)? loading,
    TResult Function(AsyncSuccess<T> value)? success,
    TResult Function(AsyncFail<T> value)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class AsyncFail<T> extends AsyncData<T> {
  const factory AsyncFail(final dynamic e) = _$AsyncFailImpl<T>;
  const AsyncFail._() : super._();

  dynamic get e;
  @JsonKey(ignore: true)
  _$$AsyncFailImplCopyWith<T, _$AsyncFailImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
