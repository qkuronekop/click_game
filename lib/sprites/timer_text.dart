import 'package:click_game/click_game.dart';
import 'package:flame/components.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerText extends TextComponent with HasGameRef<ClickGame> {
  TimerText() : super();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    position = Vector2((gameRef.size.x / 2) - 25, 80);
    textRenderer =
        TextPaint(style: GoogleFonts.audiowide().copyWith(fontSize: 28));
  }

  @override
  void update(double dt) {
    super.update(dt);
    text = gameRef.timerManager.elapsedSecs.value.toStringAsFixed(1);
  }
}
