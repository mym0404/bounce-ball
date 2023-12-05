import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:uuid/uuid.dart';

import '../export.dart';
import '../feature/common/util/dispose_bag.dart';
import '../feature/common/widget/app_dialog.dart';
import '../service/router/app_router.dart';
import 'component/ball/ball.dart';
import 'component/level/Level.dart';
import 'component/level/game_level.dart';
import 'component/level/level_background.dart';
import 'state/game_manager.dart';
import 'ui/dialog/game_ready_dialog.dart';
import 'ui/overlay/stage_start_overlay.dart';

class MainGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents, DisposeBag {
  GameManager get gameManager => di<GameManager>();

  GameLevel get gameWorld => world as GameLevel;
  Ball get ball => gameWorld.ball;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();
    add(LevelBackground());
    _listenLevelChanged();

    doOnLayout(() {
      showAppDialog(globalContext, (context) => const GameReadyDialog(), dismissible: false);
    });
  }

  void _listenLevelChanged() {
    listenValue(manager.level, (value) {
      _loadLevel(value);
      _showStageStartOverlay(value);
    }, listenInitialValue: false);
  }

  void _loadLevel(Level level) {
    var currentWorld = children.query<GameLevel>().firstOrNull;
    var showTransition = level != Level.values.first && currentWorld != null;

    var newWorld = GameLevel(level: level);

    if (showTransition) {
      currentWorld.add(
        MoveByEffect(V2(0, -size.y), EffectController(duration: 0.5, curve: Curves.easeInOutCubic))
          ..onComplete = () {
            addAll([newWorld]);
            camera = createCameraByZoomScale(world: newWorld, zoomScale: userPref.value.cameraZoomScale);
            world = newWorld;

            newWorld.add(
              SequenceEffect([
                MoveByEffect(
                  V2(0, size.y * userPref.value.cameraZoomScale),
                  EffectController(duration: 0.0001, curve: Curves.easeInOutCubic),
                ),
                MoveByEffect(
                  V2(0, -size.y * userPref.value.cameraZoomScale),
                  EffectController(duration: 0.5, curve: Curves.easeInOutCubic),
                )
              ]),
            );
          },
      );
    } else {
      addAll([newWorld]);

      camera = createCameraByZoomScale(world: newWorld, zoomScale: userPref.value.cameraZoomScale);
      world = newWorld;
    }
  }

  CameraComponent createCameraByZoomScale({required double zoomScale, required World world}) {
    var newWidth = 800 / zoomScale;
    var newHeight = 600 / zoomScale;
    // game.camera.viewfinder.visibleGameSize = V2(newWidth, newHeight);
    return CameraComponent.withFixedResolution(width: newWidth, height: newHeight, world: world)
      ..viewfinder.anchor = Anchor.topLeft;
  }

  void _showStageStartOverlay(Level level) {
    var id = const Uuid().v4();
    overlays.addEntry(
      id,
      (context, game) => StageStartOverlay(
        overlayId: id,
        stageName: level.name,
        description: level.world.name,
      ),
    );
    overlays.add(id);
  }
}
