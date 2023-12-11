import '../../../../export.dart';
import 'blur.dart';
import 'overlay_panel.dart';

Future<T?> showAppDialog<T>(
  BuildContext context,
  WidgetBuilder dialogContent, {
  bool dismissible = true,
  PanelSize size = PanelSize.m,
  double? maxHeightRatio,
  double? maxWidth,
  VC? onDismiss,
}) async {
  return showGeneralDialog<T?>(
    barrierColor: Colors.transparent,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final position = animation.drive(
        Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .chain(CurveTween(curve: Curves.easeOutExpo)),
      );
      return SlideTransition(
        position: position,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
    transitionDuration: 500.ms,
    context: context,
    useRootNavigator: true,
    barrierDismissible: false,
    barrierLabel: 'Close Dialog',
    pageBuilder: (context, animation, secondaryAnimation) {
      return _BaseAppDialog(
        dismissible: dismissible,
        child: OverlayPanel(
          size: size,
          maxHeightRatio: maxHeightRatio,
          maxWidth: maxWidth,
          child: dialogContent(context),
        ),
      );
    },
  ).then((value) {
    onDismiss?.call();
    return value;
  });
}

Future<T?> showAppAlertDialog<T>(
  BuildContext context, {
  required String title,
  String? body,
  bool showCancel = true,
  String confirmText = 'Ok',
  String cancelText = 'Cancel',
  bool dismissible = true,
  VC? onPressCancel,
  VC? onPressConfirm,
}) async {
  return showAppDialog(
    context,
    (context) => FullWidth(
      child: Column(
        children: [
          Text(title, style: TS.bodyLarge.bold),
          const Gap(12),
          if (body != null) ...[
            const Gap(8),
            Text(body),
          ],
          const Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showCancel)
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onPressCancel?.call();
                    },
                    child: Text(cancelText)),
              const Gap(8),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onPressConfirm?.call();
                },
                child: Text(confirmText),
              )
            ],
          ),
        ],
      ),
    ),
    dismissible: dismissible,
  );
}

class _BaseAppDialog extends StatefulWidget {
  const _BaseAppDialog({
    required this.child,
    required this.dismissible,
  });

  final Widget child;
  final bool dismissible;

  @override
  State<_BaseAppDialog> createState() => _BaseAppDialogState();
}

class _BaseAppDialogState extends State<_BaseAppDialog> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.dismissible) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BackdropBlur(
          blur: 0,
          borderRadius: 12.bRadius,
          colorOpacity: 0.8,
          child: GestureDetector(
            onTap: () {},
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                color: Colors.transparent,
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
