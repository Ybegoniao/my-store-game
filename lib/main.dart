import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'main_game.dart'; 
import 'main_menu.dart'; 
import 'find_setting_menu.dart';
import 'find_tutorial_menu.dart';
import 'find_game_eat.dart';
import 'find_game_memorize.dart';
import 'find_game_card.dart';
import 'find_game_cook.dart';
import 'find_game_relax.dart';
import 'find_game_finish.dart';
import 'find_recipe_firstunlock.dart';
import 'find_recipe_menu.dart';
import 'find_recipe_detail.dart';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GameWidget<MyStoreGame>(
          game: MyStoreGame(), 

          overlayBuilderMap: {
            'MainMenu': (context, game) => MainMenu(game: game as MyStoreGame),
            'FindSettingMenu': (context, game) => FindSettingMenu(game: game as MyStoreGame),
            'FindTutorialMenu': (context, game) => FindTutorialMenu(game: game as MyStoreGame),
            'FindGameEat': (context, game) => FindGameEat(game: game as MyStoreGame),
            'FindGameMemorize': (context, game) => FindGameMemorize(game: game as MyStoreGame),
            'FindGameCard': (context, game) => FindGameCard(key: UniqueKey(), game: game as MyStoreGame),
            'FindGameCook': (context, game) => FindGameCook(game: game as MyStoreGame),
            'FindGameRelax': (context, game) => FindGameRelax(game: game as MyStoreGame),
            'FindGameFinish': (context, game) => FindGameFinish(game: game as MyStoreGame),
            'FindRecipeFirstUnlock': (context, game) => FindRecipeFirstUnlock(game: game as MyStoreGame),
            'FindRecipeMenu': (context, game) => FindRecipeMenu(game: game as MyStoreGame),
            'FindRecipeDetail': (context, game) => FindRecipeDetail(game: game as MyStoreGame),
          },

          initialActiveOverlays: const ['MainMenu'],
        ),
      ),
    ),
  );
}