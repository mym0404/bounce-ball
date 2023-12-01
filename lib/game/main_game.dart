import 'package:flame/events.dart';
import 'package:flame/game.dart';

import '../export.dart';
import 'component/level/Level.dart';
import 'component/level/game_level.dart';
import 'state/game_manager.dart';

class MainGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {
  GameManager get gameManager => di<GameManager>();

  GameLevel get gameWorld => world as GameLevel;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();
    loadLevel(Level.lv01);

    // overlays.add(OverlayId.ready);
  }

  Future<void> startGame({required String nickname}) async {
    overlays.clear();
  }

  void loadLevel(Level level) {
    camera = CameraComponent.withFixedResolution(width: 800, height: 600)..viewfinder.anchor = Anchor.topLeft;
    world = GameLevel(level: level);
    camera.world = world;
    addAll([world]);
  }
}
