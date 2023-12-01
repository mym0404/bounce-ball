import 'package:flame/game.dart';

import '../export.dart';
import '../feature/common/widget/overlay_panel.dart';
import 'component/ball/ball.dart';
import 'main_game.dart';
import 'overlay/game_all_clear_overlay.dart';
import 'overlay/game_ready_overlay.dart';
import 'overlay/game_status_panel.dart';
import 'overlay/overlay_id.dart';
import 'overlay/settings_overlay.dart';
import 'state/game_manager.dart';

class GamePage extends StatefulWidget with WatchItStatefulWidgetMixin {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final MainGame _game = MainGame();

  @override
  void initState() {
    super.initState();
    di.registerSingleton(_game);
  }

  @override
  void dispose() {
    di.unregister(instance: _game);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isGameStarted = watchValue((GameManager e) => e.isGameStarted);

    return Stack(
      children: [
        GameWidget(
          game: _game,
          overlayBuilderMap: {
            OverlayId.ready: (context, game) => const GameReadyOverlay(),
            OverlayId.settings: (context, game) => const SettingsOverlay(),
            OverlayId.allClear: (context, game) => const GameAllClearOverlay()
          },
        ),
        const TopLeft(
          child: PaddingAll(24, child: OverlayPanel(child: GameStatusPanel())),
        ),
        BottomLeft(
          child: PaddingAll(
            24,
            child: GestureDetector(
              onTapDown: (details) {
                if (!isGameStarted) return;
                var ball = (_game.findByKeyName('ball') as Ball?);
                ball?.onTapDownLeft();
              },
              onTapUp: (_) {
                if (!isGameStarted) return;
                var ball = (_game.findByKeyName('ball') as Ball?);
                ball?.onTapUpLeft();
              },
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: 32.bRadius,
                  border: Border.all(color: C.white),
                  boxShadow: const [
                    BoxShadow(blurStyle: BlurStyle.outer, color: Colors.white, blurRadius: 8),
                  ],
                ),
                child: Icon(MdiIcons.arrowLeft),
              ),
            ),
          ),
        ),
        BottomRight(
          child: PaddingAll(
            24,
            child: GestureDetector(
              onTapDown: (details) {
                if (!isGameStarted) return;
                var ball = (_game.findByKeyName('ball') as Ball?);
                ball?.onTapDownRight();
              },
              onTapUp: (details) {
                if (!isGameStarted) return;
                var ball = (_game.findByKeyName('ball') as Ball?);
                ball?.onTapUpRight();
              },
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: 32.bRadius,
                  border: Border.all(color: C.white),
                  boxShadow: const [
                    BoxShadow(blurStyle: BlurStyle.outer, color: Colors.white, blurRadius: 8),
                  ],
                ),
                child: Icon(MdiIcons.arrowRight),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
