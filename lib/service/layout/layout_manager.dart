import 'dart:ui';

import '../../export.dart';
import '../../feature/common/util/edge_insets_json_converter.dart';
import '../../feature/common/util/size_json_converter.dart';

part 'layout_manager.freezed.dart';
part 'layout_manager.g.dart';

@freezed
class LayoutData with _$LayoutData {
  const LayoutData._();
  const factory LayoutData({
    @Default(Size.zero) @SizeJsonConverter() Size size,
    @Default(EdgeInsets.zero) @EdgeInsetsJsonConverter() EdgeInsets padding,
    @Default(EdgeInsets.zero) @EdgeInsetsJsonConverter() EdgeInsets viewPadding,
    @Default(EdgeInsets.zero) @EdgeInsetsJsonConverter() EdgeInsets viewInsets,
  }) = _LayoutData;

  factory LayoutData.fromJson(Map<String, dynamic> json) => _$LayoutDataFromJson(json);
}

class LayoutManager extends ValueNotifier<LayoutData> {
  LayoutManager([super.value = const LayoutData()]);

  Size get size => value.size;
  EdgeInsets get viewPadding => value.viewPadding;
  EdgeInsets get viewInsets => value.viewInsets;
  Display get display => PlatformDispatcher.instance.displays.first;

  /// Indicates which orientations the app will allow be default. Affects Android/iOS devices only.
  /// Defaults to both landscape (hz) and portrait (vt)
  List<Axis> supportedOrientations = [Axis.vertical, Axis.horizontal];

  /// Allow a view to override the currently supported orientations. For example, [FullscreenVideoViewer] always wants to enable both landscape and portrait.
  /// If a view sets this override, they are responsible for setting it back to null when finished.
  List<Axis>? _supportedOrientationsOverride;
  set supportedOrientationsOverride(List<Axis>? value) {
    if (_supportedOrientationsOverride != value) {
      _supportedOrientationsOverride = value;
    }
  }

  void onSizeChanged({
    required Size size,
    required EdgeInsets padding,
    required EdgeInsets viewPadding,
    required EdgeInsets viewInsets,
  }) {
    /// Disable landscape layout on smaller form factors
    bool isSmall = display.size.shortestSide / display.devicePixelRatio < 600;
    supportedOrientations = isSmall ? [Axis.vertical] : [Axis.vertical, Axis.horizontal];
    value = value.copyWith(
      size: size,
      padding: padding,
      viewPadding: viewPadding,
      viewInsets: viewInsets,
    );
  }
}
