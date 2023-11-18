import 'package:click_game/click_game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class TimerManager extends Component with HasGameRef<ClickGame> {
  late Timer interval;
  ValueNotifier<double> elapsedSecs = ValueNotifier(1);

  TimerManager() {
    interval = Timer(0.1, onTick: () {
      elapsedSecs.value += 0.1;
    }, repeat: true);
  }

  @override
  void update(double dt) {
    interval.update(dt);
  }

  void stopTimer() {
    interval.stop();
  }

  void resetTimer() {
    elapsedSecs.value = 0;
  }
}
