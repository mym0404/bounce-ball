import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flame/game.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../export.dart';
import '../feature/common/ui/widget/game_icon_button.dart';
import '../service/user_preferences/user_preferences.dart';
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
    var gameLevel = watchValue((GameManager e) => e.level);
    var deathCount = watchValue((GameManager e) => e.deathCount);
    var userPref = watchIt<UserPreferences>();

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
          child: PaddingAll(24, child: GameStatusPanel()),
        ),
        TopRight(
          child: PaddingAll(
            24,
            child: GameIconButton(
              icon: MdiIcons.cog,
              size: 32,
              onPressed: () {
                _game.overlays.add(OverlayId.settings);
              },
            ),
          ),
        ),
        if (userPref.value.isShowArrowControls) _leftArrow(isGameStarted),
        if (userPref.value.isShowArrowControls) _rightArrow(isGameStarted),
        BottomCenter(
          child: PaddingBottom(
            24,
            child: AnimatedTextKit(
              key: ValueKey(gameLevel),
              animatedTexts: [
                TypewriterAnimatedText(
                  gameLevel.say,
                  textStyle: TS.b2,
                  textAlign: TextAlign.center,
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              isRepeatingAnimation: false,
            ),
          ),
        ),
      ],
    );
  }

  Widget _rightArrow(bool isGameStarted) {
    return BottomRight(
      child: PaddingAll(
        24,
        child: GameIconButton(
          icon: MdiIcons.arrowRight,
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
        ),
      ),
    ).animate().fade();
  }

  Widget _leftArrow(bool isGameStarted) {
    return BottomLeft(
      child: PaddingAll(
        24,
        child: GameIconButton(
          icon: MdiIcons.arrowLeft,
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
        ),
      ),
    ).animate().fade();
  }
}
