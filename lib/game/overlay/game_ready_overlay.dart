import '../../export.dart';
import '../../feature/common/widget/blur.dart';
import '../../feature/common/widget/overlay_panel.dart';
import '../main_game.dart';

class GameReadyOverlay extends StatefulWidget {
  const GameReadyOverlay({super.key});

  @override
  State<GameReadyOverlay> createState() => _GameReadyOverlayState();
}

class _GameReadyOverlayState extends State<GameReadyOverlay> {
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
                    game.startGame(nickname: nickname.text);
                  },
                  child: const Text('시작하기'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
