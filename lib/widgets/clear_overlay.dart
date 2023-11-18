import 'package:click_game/click_game.dart';
import 'package:click_game/managers/game_manager.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameClearOverlay extends StatefulWidget {
  const GameClearOverlay({super.key, required this.game});

  final Game game;

  @override
  State createState() => _State();
}

class _State extends State<GameClearOverlay> {
  @override
  Widget build(BuildContext context) {
    ClickGame clickGame = widget.game as ClickGame;
    return Material(
      color: Colors.black,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ValueListenableBuilder(
              valueListenable: clickGame.timerManager.elapsedSecs,
              builder: (context, value, child) {
                return Text(
                  '${value.toStringAsFixed(1)} 秒',
                  style: const TextStyle(fontSize: 28),
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Game Clear 🎉',
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
