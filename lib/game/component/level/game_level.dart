import 'package:flame/effects.dart';

import '../../../export.dart';
import '../../../feature/common/util/dispose_bag.dart';
import '../ball/ball.dart';
import '../collision/CollisionBlock.dart';
import 'Level.dart';
import 'level_background.dart';

class GameLevel extends World with GRef, DisposeBag implements PositionProvider {
  GameLevel({
    required this.level,
  });

  final Level level;

  late final TiledComponent _tile;
  late final Ball _ball;
  final List<CollisionBlock> collisionBlocks = [];
  late final CollisionBlock clearBlock;
  late final CollisionBlock startBlock;

  @override
  FutureOr<void> onLoad() async {
    add(LevelBackground());
    _tile = await TiledComponent.load('${level.name}.tmx', V2.all(16));
    _tile.anchor = Anchor.center;
    _tile.position = game.size / 2;
    add(_tile);

    _initBall();
    _initCollisions();
    _initClearBlock();
  }

  void _initBall() {
    final layer = _tile.tileMap.getLayer<ObjectGroup>('spot');
    assert(layer != null);

    var ballObj = layer!.objects.firstWhere((element) => element.class_ == 'start');
    startBlock = CollisionBlock.fromObject(ballObj);

    _ball = Ball(position: V2(ballObj.x, ballObj.y), key: ComponentKey.named('ball'));
    _tile.add(_ball);
  }

  void _initCollisions() {
    final layer = _tile.tileMap.getLayer<ObjectGroup>('collision');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock.fromObject(obj);
        collisionBlocks.add(block);
      }
    }
  }

  void _initClearBlock() {
    final layer = _tile.tileMap.getLayer<ObjectGroup>('spot');
    var obj = layer!.objects.firstWhere((element) => element.class_ == 'goal');

    clearBlock = CollisionBlock.fromObject(obj);
  }

  @override
  Vector2 get position => _tile.position;

  @override
  set position(Vector2 value) {
    _tile.position = value;
  }
}
