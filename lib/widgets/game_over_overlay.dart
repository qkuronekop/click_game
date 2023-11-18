import 'package:click_game/click_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameOverOverlay extends StatefulWidget {
  const GameOverOverlay({super.key, required this.game});

  final Game game;

  @override
  State createState() => _State();
}

class _State extends State<GameOverOverlay> {
  @override
  Widget build(BuildContext context) {
    ClickGame game = widget.game as ClickGame;
    return const Material(
      color: Colors.black,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Game Over 💣',
            style: TextStyle(fontSize: 48, color: Colors.white),
          ),
        ],
      )),
    );
  }
}
