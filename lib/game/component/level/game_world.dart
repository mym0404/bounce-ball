import '../../../export.dart';
import '../../../feature/common/util/dispose_bag.dart';
import 'Level.dart';
import 'level_background.dart';

class GameLevel extends World with GRef, DisposeBag {
  GameLevel({
    required this.level,
  });

  final Level level;

  late final TiledComponent _tile;

  @override
  FutureOr<void> onLoad() async {
    add(LevelBackground());
    _tile = await TiledComponent.load('${level.name}.tmx', V2.all(16));
    _tile.anchor = Anchor.center;
    _tile.position = game.size / 2;
    add(_tile);
    _initCollisions();
  }

  void _initCollisions() {
    final collisionsLayer = _tile.tileMap.getLayer<ObjectGroup>('collision');

    // if (collisionsLayer != null) {
    //   for (final collision in collisionsLayer.objects) {
    //     switch (collision.class_) {
    //       case 'Platform':
    //         final platform = CollisionBlock(
    //           position: Vector2(collision.x, collision.y),
    //           size: Vector2(collision.width, collision.height),
    //           isPlatform: true,
    //         );
    //         collisionBlocks.add(platform);
    //         add(platform);
    //         break;
    //       default:
    //         final block = CollisionBlock(
    //           position: Vector2(collision.x, collision.y),
    //           size: Vector2(collision.width, collision.height),
    //         );
    //         collisionBlocks.add(block);
    //         add(block);
    //     }
    //   }
    // }
    // player.collisionBlocks = collisionBlocks;
  }
}
