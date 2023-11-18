import 'package:click_game/click_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MainMenuOverlay extends StatefulWidget {
  const MainMenuOverlay({super.key, required this.game});

  final Game game;

  @override
  State createState() => _State();
}

class _State extends State<MainMenuOverlay> {
  @override
  Widget build(BuildContext context) {
    ClickGame game = widget.game as ClickGame;
    return LayoutBuilder(builder: (context, constraints) {
      final TextStyle titleStyle = (constraints.maxWidth > 830)
          ? Theme.of(context).textTheme.displayLarge!
          : Theme.of(context).textTheme.displaySmall!;
      return Material(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Click Game',
                  style: titleStyle.copyWith(
                    height: .8,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 64,
                ),
                ElevatedButton(
                    onPressed: () {
                      game.gameStart();
                    },
                    child: Text(
                      'Game Start',
                      style: titleStyle.copyWith(fontSize: 24),
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}