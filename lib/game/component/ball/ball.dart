import 'package:flame/effects.dart';

import '../../../export.dart';
import '../collision/CollisionBlock.dart';
import '../level/game_level.dart';
import '../vfx/vfx_effect.dart';

class Ball extends PositionComponent with GRef, KeyboardHandler {
  Ball({super.position});

  final double _wallCollisionForce = 100;
  final double _jumpForce = 250;
  final double _wallJumpForce = 120;
  final double _maxHorizontalSpeed = 120;
  final double _horizontalForce = 150;
  final double gravity = 700;
  V2 velocity = V2.zero();

  bool isLeftPressing = false, isRightPressing = false;
  Set<LogicalKeyboardKey> _previousPressedKeys = {};

  bool isCollideLeftWall = false, isCollideRightWall = false;
  double _wallCollideDelta = 0;
  int _lastWallCollideAt = 0;
  double _effectDt = 0;

  List<CollisionBlock> get collisionBlocks => (game.world as GameLevel).collisionBlocks;

  @override
  FutureOr<void> onLoad() {
    size = V2.all(8);
    add(CircleComponent(radius: 4, paint: Paint()..color = C.white)..anchor = Anchor.center);
  }

  @override
  void update(double dt) {
    _handleInput(dt);
    _clampAndDecreaseHorizontalVelocity(dt);
    _horizontalCollisionCheckAndMove(dt);
    _applyGravity(dt);
    _verticalCollisionCheckAndMove(dt);
    _checkGameDie();
    _checkGameClear();

    if (isCollideLeftWall || isCollideRightWall) {
      _wallCollideDelta += dt;
      if (_wallCollideDelta >= 0.15) {
        _resetWallCollideStates();
      }
    }

    _effectDt += dt;
    if (_effectDt >= 0.001) {
      _createBallEffect();
      _effectDt = 0;
    }

    super.update(dt);
  }

  void _createBallEffect() {
    parent!.add(CircleComponent(radius: 4, paint: Paint()..color = C.white)
      ..add(RemoveEffect(delay: 0.6))
      ..add(OpacityEffect.fadeOut(EffectController(duration: 0.6)))
      ..position = position
      ..anchor = Anchor.center);
  }

  void _handleInput(double dt) {
    if (isCollideLeftWall || isCollideRightWall) {}

    if (isLeftPressing) {
      var diff = max(0, velocity.x - -_maxHorizontalSpeed);
      velocity.x -= min(diff, _horizontalForce * 5 * dt);
    } else if (isRightPressing) {
      var diff = max(0, _maxHorizontalSpeed - velocity.x);
      velocity.x += min(diff, _horizontalForce * 5 * dt);
    }
  }

  void _clampAndDecreaseHorizontalVelocity(double dt) {
    // if (velocity.x.abs() > _horizontalSpeed) {
    //   velocity.x -= velocity.x.sign * 100 * dt;
    // }
  }

  void _horizontalCollisionCheckAndMove(double dt) {
    if (velocity.x == 0) return;

    var nextPosition = V2(position.x + velocity.x * dt, position.y);
    for (var block in collisionBlocks) {
      if (block.toRect().overlaps(Rect.fromCircle(center: nextPosition.toOffset(), radius: 4))) {
        if (velocity.x < 0) {
          isCollideLeftWall = true;
          isCollideRightWall = false;
          parent!.add(
            GroundJumpVfxEffect()
              ..anchor = Anchor.center
              ..position = V2(
                position.x - 5 - Random().nextDouble() * 5,
                position.y,
              )
              ..angle = pi / 2,
          );
        } else {
          isCollideLeftWall = false;
          isCollideRightWall = true;
        }
        _wallCollideDelta = 0;
        _lastWallCollideAt = DateTime.now().millisecondsSinceEpoch;

        nextPosition = position;
        velocity.x = -velocity.x.sign * _wallCollisionForce;
        velocity.y += _wallCollisionForce * (Random().nextDouble() - 0.5);
        break;
      }
    }

    position = nextPosition;
  }

  void _applyGravity(double dt) {
    velocity.y += gravity * dt;
  }

  void _verticalCollisionCheckAndMove(double dt) {
    if (velocity.y == 0) return;

    var nextPosition = V2(position.x, position.y + velocity.y * dt);
    for (var block in collisionBlocks) {
      if (block.toRect().overlaps(Rect.fromCircle(center: nextPosition.toOffset(), radius: 4))) {
        if (velocity.y > 0) {
          _jump();
          nextPosition = position;
          break;
        } else {
          velocity.y *= -1;
          nextPosition = position;
          break;
        }
      }
    }

    position = nextPosition;
  }

  void _jump() {
    velocity.y = -_jumpForce;
    parent!.add(
      GroundJumpVfxEffect()
        ..anchor = Anchor.center
        ..position = V2(
          position.x + Random().nextDouble() * 5 - 2.5,
          position.y + 5 + Random().nextDouble() * 4,
        ),
    );
  }

  void _wallJump(int direction) {
    _resetWallCollideStates();

    velocity.x = _wallJumpForce * direction;
    velocity.y = -_jumpForce;
    log.i('_wallJump');
  }

  void _resetWallCollideStates() {
    _wallCollideDelta = 0;
    isCollideLeftWall = false;
    isCollideRightWall = false;
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    isLeftPressing = keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    isRightPressing = keysPressed.contains(LogicalKeyboardKey.arrowRight);

    if (isRightPressing && isCollideLeftWall) {
      _wallJump(1);
    }

    if (isLeftPressing && isCollideRightWall) {
      _wallJump(-1);
    }

    _previousPressedKeys = keysPressed;
    return super.onKeyEvent(event, keysPressed);
  }

  void _checkGameDie() {}

  void _checkGameClear() {}
}
