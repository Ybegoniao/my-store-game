import 'package:flutter/material.dart';
import 'main_game.dart';

class FindRecipeMenu extends StatelessWidget {

  final MyStoreGame game;
  const FindRecipeMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {

    int collectedCount = game.allRecipes.where((r) => r.completedCount > 0).length;
    int totalCount = game.allRecipes.length;

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
            width: 1000,
            height: 625,
            color: const Color(0xFFFFFDF5),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 1000,
                    height: 625,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 1000,
                            height: 625,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/background.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 1000,
                            height: 625,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFDF5) /* color-card */,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 22,
                  child: SizedBox(
                    width: 600,
                    child: Text(
                      '我的拿手菜',
                      style: TextStyle(
                        color: const Color(0xFF4A3222) /* color-text */,
                        fontSize: game.isLargeFont ? 50 : 44,
                        fontFamily: 'Noto Serif TC',
                        fontWeight: FontWeight.w700,
                        height: 1.30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 85,
                  child: SizedBox(
                    width: 900,
                    child: Text(
                      '每煮好一道菜，就留下一份拿手的回憶。',
                      style: TextStyle(
                        color: const Color(0xFF4A3222) /* color-text */,
                        fontSize: game.isLargeFont ? 34 : 26,
                        fontFamily: 'Noto Sans TC',
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 60,
                  top: 565,
                  child: SizedBox(
                    width: 900,
                    child: Text(
                      '點選已收錄的菜，看看食材與完成紀錄。',
                      style: TextStyle(
                        color: const Color(0xFF4A3222) /* color-text */,
                        fontSize: game.isLargeFont ? 32 : 24,
                        fontFamily: 'Noto Sans TC',
                        fontWeight: FontWeight.w500,
                        height: 1.45,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 760,
                  top: 20,
                  child: GestureDetector(
                    onTap: () { 
                      game.overlays.remove('FindRecipeMenu');
                    },
                    child: Container(
                      width: 206,
                      height: 76,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 206,
                              height: 76,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFFDF5) /* color-card */,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 3,
                                    color: const Color(0xFF7A5233) /* color-border */,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0xFF7A5233),
                                    blurRadius: 0,
                                    offset: Offset(0, 5),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                '返回日常',
                                style: TextStyle(
                                  color: const Color(0xFF4A3222) /* color-text */,
                                  fontSize: game.isLargeFont ? 38 : 30,
                                  fontFamily: 'Noto Sans TC',
                                  fontWeight: FontWeight.w700,
                                  height: 1.20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 145,
                  child: Container(
                    width: 920,
                    height: 62,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 920,
                            height: 62,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFFFDF5) /* color-card */,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: const Color(0xFF7A5233) /* color-border */,
                                ),
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: -310,
                          child: Container(
                            width: 920,
                            height: 62,
                            alignment: Alignment.center,
                            child: Text(
                              '已收錄 $collectedCount / $totalCount 道菜',
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 34 : 26,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                // 圖鑑卡片列表
                Positioned(
                  left: 60,
                  top: 235,
                  child: SizedBox(
                    width: 900,
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: game.allRecipes.map((recipe) {
                        bool isUnlocked = recipe.completedCount > 0;
                        
                        return GestureDetector(
                          onTap: () {
                            game.selectedRecipe = recipe;
                            game.overlays.remove('FindRecipeMenu');
                            game.overlays.add('FindRecipeDetail');
                          },
                          child: Container(
                            width: 270,
                            height: 295,
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFF7A5233)),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // 菜圖
                                Opacity(
                                  opacity: isUnlocked ? 1.0 : 0.3,
                                  child: Image.asset(recipe.recipeImagePath, width: 230, height: 160),
                                ),
                                const SizedBox(height: 10),
                                // 菜名
                                Text(
                                  recipe.name,
                                  textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF4A3222) /* color-text */,
                                      fontSize: game.isLargeFont ? 36 : 32,
                                      fontFamily: 'Noto Serif TC',
                                      fontWeight: FontWeight.w700,
                                      height: 1.35,
                                    ),
                                ),
                                // 狀態文字
                                Text(
                                  isUnlocked ? '已收錄・完成 ${recipe.completedCount} 次' : '尚未完成',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: isUnlocked ? const Color(0xFF3F7A4A) : const Color(0xFFA9783F),
                                    fontSize: game.isLargeFont ? 26 : 22,
                                    fontFamily: 'Noto Sans TC',
                                    fontWeight: FontWeight.w500,
                                    height: 1.45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}