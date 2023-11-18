import 'package:click_game/click_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GameOverlay extends StatefulWidget {
  const GameOverlay({super.key, required this.game});

  final Game game;

  @override
  State createState() => _State();
}

class _State extends State<GameOverlay> {
  final formatted = DateFormat('ss:SS');

  @override
  Widget build(BuildContext context) {
    ClickGame timingGame = widget.game as ClickGame;
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
              top: 60,
              left: timingGame.size.x / 2 - 10,
              child: ValueListenableBuilder(
                valueListenable: timingGame.timerManager.elapsedSecs,
                builder: (context, value, child) {
                  return Text(
                    value.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 28),
                  );
                },
              )),
        ],
      ),
    );
  }
}
