import '../../export.dart';
import '../../feature/common/widget/blur.dart';
import '../../feature/common/widget/overlay_panel.dart';

class GameReadyOverlay extends StatefulWidget {
  const GameReadyOverlay({super.key});

  @override
  State<GameReadyOverlay> createState() => _GameReadyOverlayState();
}

class _GameReadyOverlayState extends State<GameReadyOverlay> {
  @override
  Widget build(BuildContext context) {
    return BackdropBlur(
      colorOpacity: 0.1,
      child: Center(
        child: OverlayPanel(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Bounce Ball 🥎',
                  style: TS.titleLarge,
                ),
                const Gap(48),
                FilledButton.tonal(
                  onPressed: () {
                    manager.startGame();
                  },
                  child: const Text('Start'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
