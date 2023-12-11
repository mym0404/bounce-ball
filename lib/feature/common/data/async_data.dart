import '../../../export.dart';
import '../widget/conditional_builder.dart';

part 'async_data.freezed.dart';

@freezed
class AsyncData<T> with _$AsyncData<T> {
  const AsyncData._();

  const factory AsyncData.initial() = AsyncInitial<T>;
  const factory AsyncData.loading([T? data]) = AsyncLoading<T>;
  const factory AsyncData.success(T data) = AsyncSuccess<T>;
  const factory AsyncData.fail(dynamic e) = AsyncFail<T>;

  bool get isInitial => this is AsyncInitial;
  bool get isLoading => this is AsyncLoading;
  bool get isFetching => this is AsyncLoading || (this as AsyncLoading).data != null;
  bool get isSuccess => this is AsyncSuccess;
  bool get isFail => this is AsyncFail;

  T? get data => whenOrNull<T?>(
        success: (data) => data,
        loading: (data) => data,
      );
}

class AsyncDataBuilder<T> extends StatelessWidget {
  const AsyncDataBuilder(
    this.data, {
    super.key,
    this.initial,
    this.loading,
    this.success,
    this.fail,
    this.wrapper,
    this.withoutData,
    this.withData,
    this.emptyData,
    this.any,
    this.enableAnimatedSwitcher = false,
  });

  final AsyncData<T> data;

  final WidgetBuilder? initial;
  final Widget Function(BuildContext context, AsyncData<T> state, T? data)? loading;
  final Widget Function(BuildContext context, AsyncData<T> state, T data)? success;
  final Widget Function(BuildContext context, AsyncData<T> state, dynamic e)? fail;
  final Widget Function(BuildContext context, AsyncData<T> state, Widget child)? wrapper;
  final Widget Function(BuildContext context, AsyncData<T> state)? withoutData;
  final Widget Function(BuildContext context, AsyncData<T> state, T data)? withData;
  final Widget Function(BuildContext context, AsyncData<T> state)? emptyData;
  final Widget Function(BuildContext context, AsyncData<T> state)? any;

  final bool enableAnimatedSwitcher;

  @override
  Widget build(BuildContext context) {
    // match more specific condition first
    Widget? content;

    if (data.data is List && (data.data as List).isEmpty) {
      content ??= emptyData?.call(context, data);
    }

    // var showWithoutData = data.data == null && withoutData != null;
    // var showWithData = data.data != null && withData != null;

    if (data.data != null) {
      content ??= withData?.call(context, data, data.data as T);
    }

    content ??= data.map(
      initial: (state) => initial?.call(context),
      loading: (state) => loading?.call(context, state, state.data),
      success: (state) => success?.call(context, state, state.data),
      fail: (state) => fail?.call(context, state, state.data),
    );

    if (data.data == null) {
      content ??= withoutData?.call(context, data);
    }

    content ??= any?.call(context, data);
    content ??= const Empty();
    content = wrapper?.call(context, data, content) ?? content;

    return ConditionalBuilder(
      wrapper: (context, child) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        layoutBuilder: (currentChild, previousChildren) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        ),
        child: child,
      ),
      condition: enableAnimatedSwitcher,
      child: content,
    );
  }
}
