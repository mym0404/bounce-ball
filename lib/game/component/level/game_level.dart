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
  });

  final Level level;

  late final TiledComponent _tile;
  late final Ball _ball;
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
    _tile = await TiledComponent.load('${level.name}.tmx', V2.all(16));
    _tile.anchor = Anchor.center;
    _tile.position = game.size / 2;
    add(_tile);

    _initBall();
    _initCollisions();
    _initClearBlock();
    _initJumpBlocks();
    _initBombBlocks();
    _initBreakBlocks();
    _initLeftArrowBlocks();
    _initRightArrowBlocks();
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

  void _initJumpBlocks() {
    final layer = _tile.tileMap.getLayer<ObjectGroup>('jump');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock.fromObject(obj)..add(JumpBlockDecoration());
        jumpBlocks.add(block);
        _tile.add(block);
      }
    }
  }

  void _initClearBlock() {
    final layer = _tile.tileMap.getLayer<ObjectGroup>('spot');
    var obj = layer!.objects.firstWhere((element) => element.class_ == 'goal');

    clearBlock = CollisionBlock.fromObject(obj)..add(ClearBlockDecoration());
    _tile.add(clearBlock);
  }

  void _initBombBlocks() {
    final layer = _tile.tileMap.getLayer<ObjectGroup>('bomb');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock.fromObject(obj)..add(BombBlockDecoration());
        bombBlocks.add(block);
        _tile.add(block);
      }
    }
  }

  void _initBreakBlocks() {
    final layer = _tile.tileMap.getLayer<ObjectGroup>('break');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock.fromObject(obj)..add(BreakBlockDecoration());
        breakBlocks.add(block);
        _tile.add(block);
      }
    }
  }

  void removeBreakBlock(CollisionBlock block) {
    block.inActivate();
  }

  void _initLeftArrowBlocks() {
    final layer = _tile.tileMap.getLayer<ObjectGroup>('leftArrow');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock.fromObject(obj)
          ..add(RightArrowBlockDecoration()..flipHorizontallyAroundCenter());
        leftArrowBlocks.add(block);
        _tile.add(block);
      }
    }
  }

  void _initRightArrowBlocks() {
    final layer = _tile.tileMap.getLayer<ObjectGroup>('rightArrow');

    if (layer != null) {
      for (final obj in layer.objects) {
        var block = CollisionBlock.fromObject(obj)..add(RightArrowBlockDecoration());
        rightArrowBlocks.add(block);
        _tile.add(block);
      }
    }
  }

  void resetBlocks() {
    for (var e in breakBlocks) {
      e.activate();
    }
  }

  @override
  Vector2 get position => _tile.position;

  @override
  set position(Vector2 value) {
    _tile.position = value;
  }
}
