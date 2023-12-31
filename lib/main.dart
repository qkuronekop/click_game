import 'package:click_game/click_game.dart';
import 'package:click_game/util/color_schemes.dart';
import 'package:click_game/widgets/clear_overlay.dart';
import 'package:click_game/widgets/game_over_overlay.dart';
import 'package:click_game/widgets/game_overlay.dart';
import 'package:click_game/widgets/main_menu_overlay.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Click Game',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.audiowideTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

final game = ClickGame();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State createState() => _State();
}

class _State extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: const BoxConstraints(
                maxWidth: 800,
                minWidth: 550,
              ),
              child: GameWidget(
                game: game,
                overlayBuilderMap: <String,
                    Widget Function(BuildContext, Game)>{
                  mainMenuOverlay: (context, game) =>
                      MainMenuOverlay(game: game),
                  gameOverlay: (context, game) => GameOverlay(
                        game: game,
                      ),
                  gameOverOverlay: (context, game) => GameOverOverlay(
                    game: game,
                  ),
                  clearOverlay: (context, game) => GameClearOverlay(
                    game: game,
                  ),
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

const String mainMenuOverlay = 'mainMenuOverlay';
const String gameOverlay = 'gameOverlay';
const String gameOverOverlay = 'gameOverOverlay';
const String clearOverlay = 'clearOverlay';
