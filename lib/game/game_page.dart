import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flame/game.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../export.dart';
import '../feature/common/widget/app_dialog.dart';
import '../feature/common/widget/game_icon_button.dart';
import '../feature/common/widget/loading_state.dart';
import '../feature/common/widget/overlay_panel.dart';
import '../service/user_preferences/user_preferences.dart';
import 'component/ball/ball.dart';
import 'main_game.dart';
import 'state/game_manager.dart';
import 'ui/dialog/game_map_dialog.dart';
import 'ui/dialog/settings_dialog.dart';
import 'ui/overlay/overlay_id.dart';
import 'ui/panel/game_status_panel.dart';

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

    // doOnLayout(() {
    //   if (kDebugMode) {
    //     showAppDialog(
    //       context,
    //       (context) => const GameMapOverlay(),
    //       maxHeightRatio: 0.85,
    //       size: PanelSize.l,
    //     );
    //   }
    // });
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
    var userPref = watchIt<UserPreferences>();

    return Stack(
      children: [
        GameWidget(
          game: _game,
          overlayBuilderMap: {for (var overlay in OverlayId.values) overlay.name: overlay.builder},
        ),
        const TopLeft(
          child: PaddingAll(24, child: GameStatusPanel()),
        ),
        TopRight(
          child: PaddingAll(
            24,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isGameStarted) ...[
                  GameIconButton(
                    icon: MdiIcons.map,
                    size: 32,
                    onPressed: () {
                      showAppDialog(
                        context,
                        (context) => const GameMapDialog(),
                        maxHeightRatio: 0.6,
                        size: PanelSize.m,
                      );
                    },
                  ),
                  const Gap(12)
                ],
                if (isGameStarted) ...[
                  GameIconButton(
                    icon: MdiIcons.refresh,
                    size: 32,
                    onPressed: () {
                      manager.resetLevel();
                    },
                  ),
                  const Gap(12)
                ],
                GameIconButton(
                  icon: MdiIcons.cog,
                  size: 32,
                  onPressed: () {
                    showAppDialog(context, (context) => const SettingsDialog(), size: PanelSize.l);
                  },
                ),
              ],
            ),
          ),
        ),
        if (userPref.value.isShowArrowControls && isGameStarted) _leftArrow(isGameStarted),
        if (userPref.value.isShowArrowControls && isGameStarted) _rightArrow(isGameStarted),
        BottomCenter(
          child: PaddingBottom(
            24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedTextKit(
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
                const Gap(4),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(
                    MdiIcons.music,
                    color: C.onSurface50,
                    size: 16,
                  ),
                  Text(
                    gameLevel.world.bgmName,
                    style: TS.l3.onSurface50.italic,
                  ),
                ]),
              ],
            ),
          ),
        ),
        VL(
          valueListenable: manager.isGameLoading,
          builder: (context, value, child) {
            if (value) {
              return LoadingState(
                title: context.s.game_loading_title,
                body: context.s.game_loading_body,
              );
            }
            return const Empty();
          },
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
