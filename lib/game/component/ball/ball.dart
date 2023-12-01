import 'package:flame/effects.dart';

import '../../../export.dart';
import '../collision/CollisionBlock.dart';
import '../level/game_level.dart';
import '../vfx/vfx_effect.dart';

const _radius = 3.0;

double yVelocityForMaxHeight({required double gravity, required double maxHeight}) {
  return sqrt(maxHeight * 2 * gravity);
}

class Ball extends PositionComponent with GRef, KeyboardHandler {
  Ball({super.key, super.position});

  late final double _groundJumpYForce = yVelocityForMaxHeight(gravity: gravity, maxHeight: 40);
  final double _wallStrongJumpXForce = 100;
  late final double _wallStrongJumpYForce = yVelocityForMaxHeight(gravity: gravity, maxHeight: 40);
  final double _wallGeneralJumpXForce = 70;
  final double _wallGeneralJumpYForce = 60;

  final double _maxXSpeed = 120;
  final double _inputXForce = 120;
  final double gravity = 400;
  final double terminalYVelocity = 400;
  V2 velocity = V2.zero();

  bool isLeftPressing = false, isRightPressing = false;
  Set<LogicalKeyboardKey> _previousPressedKeys = {};

  double _effectDt = 0;

  List<CollisionBlock> get collisionBlocks => (game.world as GameLevel).collisionBlocks;
  CollisionBlock get clearBlock => (game.world as GameLevel).clearBlock;
  CollisionBlock get startBlock => (game.world as GameLevel).startBlock;

  bool _isRespawning = false;
  bool _isCleared = false;

  int lastStrongJump = 0;

  @override
  FutureOr<void> onLoad() {
    size = V2.all(8);
    add(CircleComponent(radius: _radius, paint: Paint()..color = C.white)..anchor = Anchor.center);
  }

  @override
  void update(double dt) {
    if (_isCleared) return;
    _effectDt += dt;
    if (_effectDt >= 0.001) {
      _createBallEffect();
      _effectDt = 0;
    }

    if (_isRespawning) return;
    _handleInput(dt);
    _horizontalCollisionCheckAndMove(dt);
    _applyGravity(dt);
    _verticalCollisionCheckAndMove(dt);
    _checkGameDie();
    _checkGameClear();

    super.update(dt);
  }

  void _createBallEffect() {
    parent!.add(CircleComponent(radius: _radius, paint: Paint()..color = C.white)
      ..add(RemoveEffect(delay: 0.6))
      ..add(OpacityEffect.fadeOut(EffectController(duration: 0.6)))
      ..position = position
      ..anchor = Anchor.center);
  }

  void _handleInput(double dt) {
    if (isLeftPressing) {
      var diff = max(0, velocity.x - -_maxXSpeed);
      velocity.x -= min(diff, _inputXForce * 5 * dt);
    } else if (isRightPressing) {
      var diff = max(0, _maxXSpeed - velocity.x);
      velocity.x += min(diff, _inputXForce * 5 * dt);
    }
  }

  void _horizontalCollisionCheckAndMove(double dt) {
    if (velocity.x == 0) return;

    var nextPosition = V2(position.x + velocity.x * dt, position.y);
    for (var block in collisionBlocks) {
      if (block.toRect().overlaps(Rect.fromCircle(center: nextPosition.toOffset(), radius: _radius))) {
        if (block.x + block.width / 2 < position.x) {
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
        break;
      }
    }

    position = nextPosition;
  }

  void _applyGravity(double dt) {
    velocity.y += gravity * dt;
    velocity.y = min(terminalYVelocity, velocity.y);
  }

  void _verticalCollisionCheckAndMove(double dt) {
    if (velocity.y == 0) return;

    var nextPosition = V2(position.x, position.y + velocity.y * dt);
    for (var block in collisionBlocks) {
      if (block.toRect().overlaps(Rect.fromCircle(center: nextPosition.toOffset(), radius: _radius))) {
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
    velocity.y = -_groundJumpYForce;
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
    velocity.y += -_wallGeneralJumpYForce * (Random().nextDouble() - 0.5);
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
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (!manager.isGameStarted.value || setEquals(keysPressed, _previousPressedKeys)) return true;

    isLeftPressing = keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    isRightPressing = keysPressed.contains(LogicalKeyboardKey.arrowRight);

    _previousPressedKeys = keysPressed;
    return super.onKeyEvent(event, keysPressed);
  }

  void onTapDownLeft() {
    isLeftPressing = true;
  }

  void onTapDownRight() {
    isRightPressing = true;
  }

  void onTapUpLeft() {
    isLeftPressing = false;
  }

  void onTapUpRight() {
    isRightPressing = false;
  }

  void _checkGameDie() {
    var isOverlap =
        game.size.toRect().overlaps(Rect.fromCircle(center: position.toOffset(), radius: _radius));
    if (!isOverlap) {
      _isRespawning = true;
      manager.die();
      add(
        MoveToEffect(startBlock.position, EffectController(duration: 1, curve: Curves.easeInOutCubic))
          ..onComplete = () {
            _isRespawning = false;
            velocity = V2.zero();
          },
      );
    }
  }

  void _checkGameClear() {
    if (clearBlock.toRect().overlaps(Rect.fromCircle(center: position.toOffset(), radius: _radius))) {
      _isCleared = true;
      removeFromParent();
      manager.clearLevel();
    }
  }
}
