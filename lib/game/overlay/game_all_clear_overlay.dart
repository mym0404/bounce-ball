import '../../export.dart';
import '../../feature/common/widget/blur.dart';
import '../../feature/common/widget/overlay_panel.dart';
import '../main_game.dart';

class GameAllClearOverlay extends StatefulWidget {
  const GameAllClearOverlay({super.key});

  @override
  State<GameAllClearOverlay> createState() => _GameAllClearOverlayState();
}

class _GameAllClearOverlayState extends State<GameAllClearOverlay> {
  late final nickname = TC(text: '문명주');

  MainGame get game => di();

  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      // 500.ms.runAfter(() {
      //   game.startGame(nickname: nickname.text);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropBlur(
      colorOpacity: 0.1,
      child: Center(
        child: OverlayPanel(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'All Clear!\nThank you for Playing',
                style: TS.titleLarge,
              ),
              const Gap(48),
              FilledButton.tonal(
                  onPressed: () {
                    manager.resetGame();
                  },
                  child: const Text('Go to Home')),
              const Gap(24),
              Text(
                'MJ Studio. 2024',
                style: TS.l2.c(C.onSurface50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}