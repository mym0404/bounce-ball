import '../../../export.dart';
import '../../../feature/common/util/dispose_bag.dart';
import '../ball/ball.dart';
import '../collision/CollisionBlock.dart';
import 'Level.dart';
import 'level_background.dart';

class GameLevel extends World with GRef, DisposeBag {
  GameLevel({
    required this.level,
  });

  final Level level;

  late final TiledComponent _tile;
  late final Ball _ball;
  final List<CollisionBlock> collisionBlocks = [];

  @override
  FutureOr<void> onLoad() async {
    add(LevelBackground());
    _tile = await TiledComponent.load('${level.name}.tmx', V2.all(16));
    _tile.anchor = Anchor.center;
    _tile.position = game.size / 2;
    add(_tile);

    _initBall();
    _initCollisions();
  }

  void _initBall() {
    final layer = _tile.tileMap.getLayer<ObjectGroup>('spot');
    assert(layer != null);

    var ballObj = layer!.objects.firstWhere((element) => element.class_ == 'start');

    _ball = Ball(position: V2(ballObj.x, ballObj.y));
    _tile.add(_ball);
  }

  void _initCollisions() {
    final layer = _tile.tileMap.getLayer<ObjectGroup>('collision');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock(size: V2(obj.width, obj.height), position: V2(obj.x, obj.y));
        collisionBlocks.add(block);
      }
    }
  }
}
