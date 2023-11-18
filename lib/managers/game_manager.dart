import 'package:click_game/click_game.dart';
import 'package:flame/components.dart';

class GameManager extends Component with HasGameRef<ClickGame> {
  GameState state = GameState.intro;

  bool get isIntro => state == GameState.intro;

  bool get isPlaying => state == GameState.playing;

  bool get isGameOver => state == GameState.gameOver;

  bool get isGameClear => state == GameState.gameClear;

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.monster001.clicked &&
        gameRef.monster002.clicked &&
        gameRef.monster003.clicked &&
        gameRef.monster004.clicked) {
      gameRef.timerManager.stopTimer();
      state = GameState.gameClear;
      return;
    }
    if (gameRef.timerManager.elapsedSecs.value >= 5) {
      state = GameState.gameOver;
    }
  }
}

enum GameState {
  intro,
  playing,
  gameOver,
  gameClear;
}
