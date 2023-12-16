import 'dart:collection';

import 'package:flame/effects.dart';

import '../../../export.dart';
import '../collision/collision_block.dart';
import '../level/game_level.dart';
import '../vfx/vfx_effect.dart';

double yVelocityForMaxHeight({required double gravity, required double maxHeight}) {
  return sqrt(maxHeight * 2 * gravity);
}

class Ball extends PositionComponent with GRef, KeyboardHandler {
  Ball({super.key, super.position});

  static const ballRadius = 3.0;

  late final double _groundJumpYForce = yVelocityForMaxHeight(gravity: gravity, maxHeight: 16 * 2 + 4);
  late final double _jumpBlockJumpYForce = yVelocityForMaxHeight(gravity: gravity, maxHeight: 16 * 6 + 4);
  final double _wallStrongJumpXForce = 130;
  late final double _wallStrongJumpYForce = yVelocityForMaxHeight(gravity: gravity, maxHeight: 50);
  final double _wallGeneralJumpXForce = 70;
  final double _wallGeneralJumpYForce = 15;

  final double _maxXSpeed = 120;
  final double _flyingXSpeed = 170;
  final double _inputXForce = 120;
  final double gravity = 600;
  final double terminalYVelocity = 400;
  V2 velocity = V2.zero();

  bool isLeftPressing = false, isRightPressing = false;
  Set<LogicalKeyboardKey> _previousPressedKeys = {};

  double _effectDt = 0;
  final Queue<CircleComponent> _circleEffects = Queue();

  GameLevel get level => game.world as GameLevel;
  List<CollisionBlock> get collisionBlocks => level.collisionBlocks;
  List<CollisionBlock> get jumpBlocks => level.jumpBlocks;
  List<CollisionBlock> get bombBlocks => level.bombBlocks;
  List<CollisionBlock> get breakBlocks => level.breakBlocks;
  List<CollisionBlock> get leftArrowBlocks => level.leftArrowBlocks;
  List<CollisionBlock> get rightArrowBlocks => level.rightArrowBlocks;
  CollisionBlock get clearBlock => level.clearBlock;
  CollisionBlock get startBlock => level.startBlock;

  bool _isRespawning = false;
  bool _isCleared = false;
  bool _isReady = true;

  int lastStrongJump = 0;

  bool _isFlyingByRightArrow = false;
  bool _isFlyingByLeftArrow = false;
  bool get _isFlying => _isFlyingByRightArrow || _isFlyingByLeftArrow;
  set _isFlying(bool value) {
    if (value == false) {
      _isFlyingByLeftArrow = _isFlyingByRightArrow = false;
    } else {
      assert(false);
    }
  }

  // region init

  @override
  FutureOr<void> onLoad() {
    size = V2.all(8);
    add(_createCircle());

    for (int i = 0; i < 30; i++) {
      var circle = _createCircle()..opacity = 0;
      _circleEffects.addLast(circle);
      parent?.add(circle);
    }
  }

  CircleComponent _createCircle() =>
      CircleComponent(radius: ballRadius, paint: Paint()..color = C.white)..anchor = Anchor.center;

  // endregion

  // region update

  @override
  void update(double dt) {
    if (_isCleared) return;

    if (!_isRespawning && !_isReady) {
      _handleInput(dt);
      _handleHorizontalMove(dt);
      if (!_isFlying) _applyGravity(dt);
      _verticalCollisionCheckAndMove(dt);
      _checkGameDieByOutside();
      _checkGameClear();
    }

    _effectDt += dt;
    while (_effectDt >= 1 / 33) {
      _updateBallEffect(position);
      _effectDt -= 1 / 33;
    }

    super.update(dt);
  }

  void _updateBallEffect(V2 pos) {
    var first = _circleEffects.removeFirst();
    first.position = pos;
    first.opacity = 1;
    first.scale = V2.all(1);
    first.add(OpacityEffect.fadeOut(EffectController(duration: 1)));
    first.add(ScaleEffect.to(V2.all(0.5), EffectController(duration: 1)));
    _circleEffects.addLast(first);
  }

  void _applyGravity(double dt) {
    velocity.y += gravity * dt;
    velocity.y = min(terminalYVelocity, velocity.y);
  }

  void _handleInput(double dt) {
    if (_isFlying) return;
    if (isLeftPressing && isRightPressing) return;
    if (isLeftPressing) {
      var diff = max(0, velocity.x - -_maxXSpeed);
      velocity.x -= min(diff, _inputXForce * 5 * dt);
    } else if (isRightPressing) {
      var diff = max(0, _maxXSpeed - velocity.x);
      velocity.x += min(diff, _inputXForce * 5 * dt);
    }
  }

  void _handleHorizontalMove(double dt) {
    if (velocity.x == 0) return;
    var nextPosition = V2(position.x + velocity.x * dt, position.y);
    _checkCollisionsWithNextPosition(nextPosition, isHorizontal: true);
  }

  void _verticalCollisionCheckAndMove(double dt) {
    if (velocity.y == 0) return;
    var nextPosition = V2(position.x, position.y + velocity.y * dt);
    _checkCollisionsWithNextPosition(nextPosition, isHorizontal: false);
  }

  void _checkCollisionsWithNextPosition(V2 nextPosition, {required bool isHorizontal}) {
    if (_isCollidedWithBomb(nextPosition) != null) {
      position = nextPosition;
      parent!.add(
        BombVfxEffect()
          ..anchor = Anchor.center
          ..position = position,
      );
      _die();
      sfx.playDieBomb();
      return;
    }

    CollisionBlock? breakBlock = _isCollidedWithBreak(nextPosition);
    CollisionBlock? generalCollisionBlock = _isCollidedWithGeneralCollisions(nextPosition);
    if (breakBlock != null && !isHorizontal && velocity.y > 0) {
      level.removeBreakBlock(breakBlock);
      _jump();
      parent!.add(
        BombVfxEffect()
          ..anchor = Anchor.center
          ..position = V2(position.x, position.y + 8),
      );
      manager.increaseBounceCount();
      sfx.playBounce();
      return;
    }

    CollisionBlock? rightArrowBlock = _isCollidedWithRightArrow(nextPosition);
    CollisionBlock? leftArrowBlock = _isCollidedWithLeftArrow(nextPosition);
    if (rightArrowBlock != null) {
      _isFlyingByRightArrow = true;
      position = V2(rightArrowBlock.x + rightArrowBlock.width + ballRadius + 1,
          rightArrowBlock.y + rightArrowBlock.height / 2);
      velocity = V2(_flyingXSpeed, 0);
      manager.increaseBounceCount();
      sfx.playArrow();
      return;
    }
    if (leftArrowBlock != null) {
      _isFlyingByLeftArrow = true;
      position = V2(leftArrowBlock.x - ballRadius - 1, leftArrowBlock.y + leftArrowBlock.height / 2);
      velocity = V2(-_flyingXSpeed, 0);
      manager.increaseBounceCount();
      sfx.playArrow();
      return;
    }

    if (generalCollisionBlock != null) {
      _isFlying = false;
      manager.increaseBounceCount();

      if (isHorizontal) {
        if (generalCollisionBlock.x + generalCollisionBlock.width / 2 < position.x) {
          // left collision
          if (isRightPressing && unixMs - lastStrongJump >= 500) {
            _wallStrongJump(1);
            isLeftPressing = false;
          } else {
            _wallGeneralJump(1);
          }
        } else {
          if (isLeftPressing && unixMs - lastStrongJump >= 500) {
            _wallStrongJump(-1);
            isRightPressing = false;
          } else {
            _wallGeneralJump(-1);
          }
        }
        nextPosition = position;
      } else {
        if (velocity.y > 0) {
          if (_isCollidedWithJump(nextPosition) != null) {
            _jump(jumpBlock: true);
          } else {
            _jump();
          }
          nextPosition = position;
        } else {
          velocity.y *= -1;
          nextPosition = position;
        }
        sfx.playBounce();
      }
    }

    position = nextPosition;
  }

  void _checkGameDieByOutside() {
    var isOverlap =
        game.size.toRect().overlaps(Rect.fromCircle(center: position.toOffset(), radius: ballRadius));
    if (!isOverlap) {
      sfx.playDieOutOfBound();
      _die();
    }
  }

  void _checkGameClear() {
    if (_isCollidedWithClear(position)) {
      _isCleared = true;
      removeFromParent();
      manager.clearLevel();
    }
  }

  // endregion

  // region action

  void _jump({bool jumpBlock = false}) {
    velocity.y = -(jumpBlock ? _jumpBlockJumpYForce : _groundJumpYForce);
    parent!.add(
      GroundJumpVfxEffect()
        ..anchor = Anchor.center
        ..position = V2(
          position.x + Random().nextDouble() * 5 - 2.5,
          position.y + 5 + Random().nextDouble() * 4,
        ),
    );
  }

  void _wallGeneralJump(int direction) {
    parent!.add(
      GroundJumpVfxEffect()
        ..anchor = Anchor.center
        ..position = V2(
          position.x + (5 - Random().nextDouble() * 5) * -direction,
          position.y,
        )
        ..angle = pi / 2,
    );

    velocity.x = direction * _wallGeneralJumpXForce * (0.5 + Random().nextDouble());
    velocity.y += -_wallGeneralJumpYForce * (Random().nextDouble() - 0.4);
    sfx.playBounce();
  }

  void _wallStrongJump(int direction) {
    lastStrongJump = unixMs;
    parent!.add(WallStrongJumpVfxEffect()
      ..anchor = Anchor.center
      ..position = V2(
        position.x + (5 - Random().nextDouble() * 5) * -direction,
        position.y,
      ));

    velocity.x = _wallStrongJumpXForce * direction;
    velocity.y = -_wallStrongJumpYForce;
    sfx.playJumpWall();
  }

  void _die() {
    manager.die();
    reset();
  }

  void reset() {
    _isRespawning = true;
    _isFlying = false;
    isLeftPressing = false;
    isRightPressing = false;
    add(
      MoveToEffect(startBlock.position, EffectController(duration: 1, curve: Curves.easeInOutCubic))
        ..onComplete = () {
          _isRespawning = false;
          velocity = V2.zero();
        },
    );
    level.resetBlocks();
    manager.resetScore(resetDie: false);
  }

  // endregion

  // region input

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (!manager.isGameStarted.value || setEquals(keysPressed, _previousPressedKeys)) return true;

    for (var key in keysPressed) {
      if (!_previousPressedKeys.contains(key)) {
        _onKeyDown(key);
      }
    }

    isLeftPressing = keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    isRightPressing = keysPressed.contains(LogicalKeyboardKey.arrowRight);

    _previousPressedKeys = keysPressed;
    return super.onKeyEvent(event, keysPressed);
  }

  void onTapDownLeft() {
    isLeftPressing = true;
    _onKeyDown(LogicalKeyboardKey.arrowLeft);
  }

  void onTapDownRight() {
    isRightPressing = true;
    _onKeyDown(LogicalKeyboardKey.arrowRight);
  }

  void onTapUpLeft() {
    isLeftPressing = false;
  }

  void onTapUpRight() {
    isRightPressing = false;
  }

  void _onKeyDown(LogicalKeyboardKey key) {
    _isReady = false;
    if (_isRespawning) return;
    if (_isFlying && (key == LogicalKeyboardKey.arrowLeft || key == LogicalKeyboardKey.arrowRight)) {
      _isFlying = false;
    }
    if (key == LogicalKeyboardKey.keyR) {
      reset();
    }
  }

  // endregion

  // region util

  CollisionBlock? _isCollidedWithGeneralCollisions(V2 position) =>
      collisionBlocks.firstWhereOrNull((element) => element.isOverlapWithBallNextPosition(position));

  CollisionBlock? _isCollidedWithBomb(V2 position) =>
      bombBlocks.firstWhereOrNull((element) => element.isOverlapWithBallNextPosition(position));

  CollisionBlock? _isCollidedWithBreak(V2 position) =>
      breakBlocks.firstWhereOrNull((element) => element.isOverlapWithBallNextPosition(position));

  CollisionBlock? _isCollidedWithJump(V2 position) =>
      jumpBlocks.firstWhereOrNull((element) => element.isOverlapWithBallNextPosition(position));

  CollisionBlock? _isCollidedWithLeftArrow(V2 position) =>
      leftArrowBlocks.firstWhereOrNull((element) => element.isOverlapWithBallNextPosition(position));

  CollisionBlock? _isCollidedWithRightArrow(V2 position) =>
      rightArrowBlocks.firstWhereOrNull((element) => element.isOverlapWithBallNextPosition(position));

  bool _isCollidedWithClear(V2 position) => clearBlock.isOverlapWithBallNextPosition(position);

  // endregion
}
