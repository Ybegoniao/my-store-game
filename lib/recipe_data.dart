
// 定義食材
class Ingredient {
  final String name;       // 食材名稱 (例如: 番茄)
  final String imagePath;  // 食材圖片路徑 (例如: assets/images/tomato.png)

  Ingredient({required this.name, required this.imagePath});
}

// 定義食譜
class Recipe {
  final String id;
  final String name;
  final String dishImagePath;
  final String recipeImagePath;
  final List<Ingredient> ingredients;
  final String description;
  int completedCount;

  Recipe({
    required this.id,
    required this.name,
    required this.dishImagePath,
    required this.recipeImagePath,
    required this.ingredients,
    required this.description,
    this.completedCount = 0, 
  });
}