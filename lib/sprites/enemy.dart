import 'package:click_game/click_game.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';

abstract class Enemy extends SpriteComponent
    with HasGameRef<ClickGame>, TapCallbacks {
  Enemy()
      : super(
          anchor: Anchor.center,
          priority: 10,
        );

  double get enemySpeed;

  bool isRight = false;
  bool isTop = false;

  final scaleEffect = ScaleEffect.by(Vector2.all(2.0), EffectController(duration: 0.3));
  final removeEffect = RemoveEffect(delay: 0.3);

  void onStartMove(double dt) {
    double positionX = position.x;
    double positionY = position.y;
    final halfX = (size.x / 2).ceil();
    final halfY = (size.y / 2).ceil();
    if (positionX.ceil() >= gameRef.size.x.ceil() - halfX) {
      isRight = false;
    }
    if (positionX.ceil() <= halfX.ceil()) {
      isRight = true;
    }
    if (positionY.ceil() >= gameRef.size.y.ceil() - halfY) {
      isTop = true;
    }
    if (positionY.ceil() <= halfY) {
      isTop = false;
    }
    if (isRight) {
      positionX = positionX + 1 * enemySpeed;
    } else {
      positionX = positionX - 1 * enemySpeed;
    }
    if (isTop) {
      positionY = positionY - 1 * enemySpeed;
    } else {
      positionY = positionY + 1 * enemySpeed;
    }
    position = Vector2(positionX, positionY);
  }

  void tapEffect() {
    add(scaleEffect);
    add(removeEffect);
  }

  void reset() {
    remove(scaleEffect);
    remove(removeEffect);
  }
}

// 凶器人形
class Monster001 extends Enemy {
  Monster001() {
    size = Vector2(100, 100);
  }

  bool clicked = false;

  @override
  double get enemySpeed => 3.0;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game/monster_001.png');
    position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    onStartMove(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    print('人形 ${event.localPosition}');
    tapEffect();
    clicked = true;
  }
}

// 仮面の亡霊
class Monster002 extends Enemy {
  Monster002() : super() {
    position = Vector2(100, 300);
    size = Vector2(100, 100);
  }

  bool clicked = false;

  @override
  double get enemySpeed => 4.0;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game/monster_002.png');
    position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    onStartMove(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    print('仮面 ${event.localPosition}');
    tapEffect();
    clicked = true;
  }
}

class Monster003 extends Enemy {
  Monster003() : super() {
    position = Vector2(100, 400);
    size = Vector2(100, 100);
  }

  @override
  double get enemySpeed => 6.0;

  bool clicked = false;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game/monster_003.png');
    position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    onStartMove(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    print('鳥 ${event.localPosition}');
    tapEffect();
    clicked = true;
  }
}

class Monster004 extends Enemy {
  Monster004() : super() {
    position = Vector2(200, 400);
    size = Vector2(100, 100);
  }

  @override
  double get enemySpeed => 10.0;

  bool clicked = false;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game/monster_004.png');
    position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    onStartMove(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    print('いか ${event.localPosition}');
    tapEffect();
    clicked = true;
  }
}
