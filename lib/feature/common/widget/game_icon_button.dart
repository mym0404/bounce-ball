import '../../../export.dart';

class GameIconButton extends StatelessWidget {
  const GameIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.size = 52,
    this.onTapDown,
    this.onTapUp,
  });

  final void Function()? onPressed;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final IconData icon;
  final int size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: onPressed != null || onTapDown != null || onTapUp != null,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onPressed,
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          child: Container(
            width: size.toDouble(),
            height: size.toDouble(),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: C.primary30),
              boxShadow: [
                BoxShadow(color: C.white.withOpacity(0.3), blurStyle: BlurStyle.outer, blurRadius: 4),
              ],
            ),
            child: Icon(
              icon,
            ),
          ),
        ),
      ),
    );
  }
}
