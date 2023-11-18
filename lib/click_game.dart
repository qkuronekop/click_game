import 'package:click_game/main.dart';
import 'package:click_game/managers/game_manager.dart';
import 'package:click_game/managers/timer_manager.dart';
import 'package:click_game/sprites/enemy.dart';
import 'package:click_game/sprites/timer_text.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class ClickGame extends FlameGame {
  GameManager gameManager = GameManager();
  TimerManager timerManager = TimerManager();
  final monster001 = Monster001();
  final monster002 = Monster002();
  final monster003 = Monster003();
  final monster004 = Monster004();
  final timerText = TimerText();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await _setCharacter();
    await add(gameManager);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameManager.isIntro) {
      overlays.add(mainMenuOverlay);
      return;
    }
    if (gameManager.isPlaying) {
      overlays.remove(mainMenuOverlay);
      overlays.remove(clearOverlay);
      add(timerManager);
      add(timerText);
      return;
    }
    if (gameManager.isGameClear) {
      overlays.add(clearOverlay);
    }
    if (gameManager.isGameOver) {
      overlays.add(gameOverOverlay);
    }
  }

  void gameStart() {
    gameManager.state = GameState.playing;
  }

  Future<void> _setCharacter() async {
    await add(monster001);
    await add(monster002);
    await add(monster003);
    await add(monster004);
  }
}
