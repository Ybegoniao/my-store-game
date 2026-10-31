import 'package:flame/game.dart';
import 'dart:math'; 
import 'recipe_data.dart'; 

class MyStoreGame extends FlameGame {
  Recipe? currentOrder;
  Recipe? selectedRecipe;
  List<Recipe> cookedDishes = []; 
  int currentDay = 3;
  bool isLargeFont = false;    
  bool isSoundOn = true;  
  bool isReadAloudOn = true;

  final Random _random = Random();

  //食材資料庫
  final List<Ingredient> allAvailableIngredients = [
    Ingredient(name: '番茄', imagePath: 'lib/assets/images/food_tomato.png'),
    Ingredient(name: '雞蛋', imagePath: 'lib/assets/images/food_egg.png'),
    Ingredient(name: '蔥', imagePath: 'lib/assets/images/food_green_onion.png'),
    Ingredient(name: '高麗菜', imagePath: 'lib/assets/images/food_cabbage.png'),
    Ingredient(name: '胡蘿蔔', imagePath: 'lib/assets/images/food_carrot.png'),
    Ingredient(name: '香菇', imagePath: 'lib/assets/images/food_mushroom.png'),
    Ingredient(name: '豆腐', imagePath: 'lib/assets/images/food_tofu.png'), 
    Ingredient(name: '茄子', imagePath: 'lib/assets/images/food_eggplant.png'),
    Ingredient(name: '玉米', imagePath: 'lib/assets/images/food_corn.png'),
  ];
  
  // 食譜資料庫
  final List<Recipe> allRecipes = [
    Recipe(
      id: '001',
      name: '番茄炒蛋',
      dishImagePath: 'lib/assets/images/dish_tomato_egg.png', 
      recipeImagePath: 'lib/assets/images/recipe_tomato_egg.png',
      ingredients: [
        Ingredient(name: '番茄', imagePath: 'lib/assets/images/food_tomato.png'),
        Ingredient(name: '雞蛋', imagePath: 'lib/assets/images/food_egg.png'),
        Ingredient(name: '蔥', imagePath: 'lib/assets/images/food_green_onion.png'),
      ],
      description: '家常味道，慢慢煮也很好。'
    ),
    Recipe(
      id: '002',
      name: '炒高麗菜',
      dishImagePath: 'lib/assets/images/dish_fried_cabbage.png',
      recipeImagePath: 'lib/assets/images/recipe_fried_cabbage.png',
      ingredients: [
        Ingredient(name: '高麗菜', imagePath: 'lib/assets/images/food_cabbage.png'),
        Ingredient(name: '胡蘿蔔', imagePath: 'lib/assets/images/food_carrot.png'),
        Ingredient(name: '香菇', imagePath: 'lib/assets/images/food_mushroom.png'),
      ],
      description: '鮮甜高麗菜，慢炒越炒越香。'
    ),
    Recipe(
      id: '003',
      name: '蔥花蛋',
      dishImagePath: 'lib/assets/images/dish_onion_egg.png',
      recipeImagePath: 'lib/assets/images/recipe_onion_egg.png',
      ingredients: [
        Ingredient(name: '雞蛋', imagePath: 'lib/assets/images/food_egg.png'),
        Ingredient(name: '蔥', imagePath: 'lib/assets/images/food_green_onion.png'),
        Ingredient(name: '香菇', imagePath: 'lib/assets/images/food_mushroom.png'),
      ],
      description: '經典家常菜，簡單又美味。'
    ),
  ];

  // 隨機抽單
  void generateNewOrder() {
    final random = Random();
    int randomIndex = random.nextInt(allRecipes.length);
    currentOrder = allRecipes[randomIndex];
    print('孫子點了：${currentOrder!.name}');
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // 其他初始化...
  }
}