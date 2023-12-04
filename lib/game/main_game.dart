import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import '../export.dart';
import '../feature/common/util/dispose_bag.dart';
import '../feature/common/widget/app_dialog.dart';
import '../service/router/app_router.dart';
import 'component/ball/ball.dart';
import 'component/level/Level.dart';
import 'component/level/game_level.dart';
import 'component/level/level_background.dart';
import 'overlay/game_ready_overlay.dart';
import 'state/game_manager.dart';

class MainGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents, DisposeBag {
  GameManager get gameManager => di<GameManager>();

  GameLevel get gameWorld => world as GameLevel;
  Ball get ball => gameWorld.ball;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();
    add(LevelBackground());
    listenValue(manager.level, (value) {
      loadLevel(value);
    }, listenInitialValue: false);

    showAppDialog(globalContext, (context) => const GameReadyOverlay(), dismissible: false);
  }

  void loadLevel(Level level) {
    var currentWorld = children.query<GameLevel>().firstOrNull;
    var showTransition = level != Level.values.first && currentWorld != null;

    var newWorld = GameLevel(level: level);

    if (showTransition) {
      currentWorld.add(
        MoveByEffect(V2(0, -size.y), EffectController(duration: 0.5, curve: Curves.easeInOutCubic))
          ..onComplete = () {
            addAll([newWorld]);
            camera = CameraComponent.withFixedResolution(width: 800, height: 600, world: newWorld)
              ..viewfinder.anchor = Anchor.topLeft;
            world = newWorld;

            newWorld.add(
              SequenceEffect([
                MoveByEffect(
                  V2(0, size.y),
                  EffectController(duration: 0.0001, curve: Curves.easeInOutCubic),
                ),
                MoveByEffect(
                  V2(0, -size.y),
                  EffectController(duration: 0.5, curve: Curves.easeInOutCubic),
                )
              ]),
            );
          },
      );
    } else {
      addAll([newWorld]);
      camera = CameraComponent.withFixedResolution(width: 800, height: 600, world: newWorld)
        ..viewfinder.anchor = Anchor.topLeft;
      world = newWorld;
    }
  }
}
