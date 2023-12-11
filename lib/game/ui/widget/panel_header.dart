import '../../../export.dart';

class PanelHeader extends StatelessWidget {
  const PanelHeader({
    super.key,
    required this.title,
    this.mode = PanelHeaderMode.close,
    this.onPress,
    this.hideBack = false,
    this.right = const [],
  });

  final String title;
  final PanelHeaderMode mode;
  final VC? onPress;
  final bool hideBack;
  final List<Widget> right;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (mode == PanelHeaderMode.back && !hideBack)
          IconButton(
            onPressed: onPress ?? () => Navigator.maybePop(context),
            icon: Icon(MdiIcons.chevronLeft),
          ),
        Expanded(
          child: Text(
            title,
            style: TS.t2.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ...right,
            if (mode == PanelHeaderMode.close && !hideBack)
              IconButton(
                onPressed: onPress ?? () => Navigator.maybePop(context),
                icon: Icon(MdiIcons.close),
              ),
          ],
        ),
      ],
    );
  }
}

enum PanelHeaderMode { back, close }
