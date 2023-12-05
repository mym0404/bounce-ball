import 'package:flame/effects.dart';

import '../../../export.dart';
import '../../../feature/common/util/dispose_bag.dart';
import '../ball/ball.dart';
import '../block_decoration/bomb_block_decoration.dart';
import '../block_decoration/break_block_decoration.dart';
import '../block_decoration/clear_block_decoration.dart';
import '../block_decoration/jump_block_decoration.dart';
import '../block_decoration/right_arrow_block_decoration.dart';
import '../collision/collision_block.dart';
import 'Level.dart';

class GameLevel extends World with GRef, DisposeBag implements PositionProvider {
  GameLevel({
    required this.level,
    required this.tile,
  });

  final Level level;

  final TiledComponent tile;
  late final Ball ball;
  final List<CollisionBlock> collisionBlocks = [];
  final List<CollisionBlock> jumpBlocks = [];
  final List<CollisionBlock> bombBlocks = [];
  final List<CollisionBlock> breakBlocks = [];
  final List<CollisionBlock> leftArrowBlocks = [];
  final List<CollisionBlock> rightArrowBlocks = [];
  late final CollisionBlock clearBlock;
  late final CollisionBlock startBlock;

  @override
  FutureOr<void> onLoad() async {
    tile.anchor = Anchor.center;
    tile.position = game.size / 2;
    add(tile);

    _initBall();
    _initCollisions();
    _initClearBlock();
    _initJumpBlocks();
    _initBombBlocks();
    _initBreakBlocks();
    _initLeftArrowBlocks();
    _initRightArrowBlocks();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    doOnLayout(() {
      tile.position = game.size / 2;
    });
  }

  void _initBall() {
    final layer = tile.tileMap.getLayer<ObjectGroup>('spot');
    assert(layer != null);

    var ballObj = layer!.objects.firstWhere((element) => element.class_ == 'start');
    startBlock = CollisionBlock.fromObject(ballObj);

    ball = Ball(position: V2(ballObj.x, ballObj.y), key: ComponentKey.named('ball'));
    tile.add(ball);
  }

  void _initCollisions() {
    final layer = tile.tileMap.getLayer<ObjectGroup>('collision');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock.fromObject(obj);
        collisionBlocks.add(block);
      }
    }
  }

  void _initJumpBlocks() {
    final layer = tile.tileMap.getLayer<ObjectGroup>('jump');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock.fromObject(obj)..add(JumpBlockDecoration());
        jumpBlocks.add(block);
        tile.add(block);
      }
    }
  }

  void _initClearBlock() {
    final layer = tile.tileMap.getLayer<ObjectGroup>('spot');
    var obj = layer!.objects.firstWhere((element) => element.class_ == 'goal');

    clearBlock = CollisionBlock.fromObject(obj)..add(ClearBlockDecoration());
    tile.add(clearBlock);
  }

  void _initBombBlocks() {
    final layer = tile.tileMap.getLayer<ObjectGroup>('bomb');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock.fromObject(obj)..add(BombBlockDecoration());
        bombBlocks.add(block);
        tile.add(block);
      }
    }
  }

  void _initBreakBlocks() {
    final layer = tile.tileMap.getLayer<ObjectGroup>('break');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock.fromObject(obj)..add(BreakBlockDecoration());
        breakBlocks.add(block);
        tile.add(block);
      }
    }
  }

  void removeBreakBlock(CollisionBlock block) {
    block.inActivate();
  }

  void _initLeftArrowBlocks() {
    final layer = tile.tileMap.getLayer<ObjectGroup>('leftArrow');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock.fromObject(obj)
          ..add(RightArrowBlockDecoration()..flipHorizontallyAroundCenter());
        leftArrowBlocks.add(block);
        tile.add(block);
      }
    }
  }

  void _initRightArrowBlocks() {
    final layer = tile.tileMap.getLayer<ObjectGroup>('rightArrow');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock.fromObject(obj)..add(RightArrowBlockDecoration());
        rightArrowBlocks.add(block);
        tile.add(block);
      }
    }
  }

  void resetBlocks() {
    for (var e in breakBlocks) {
      e.activate();
    }
  }

  @override
  Vector2 get position => tile.position;

  @override
  set position(Vector2 value) {
    tile.position = value;
  }
}
