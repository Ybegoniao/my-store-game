import 'package:flutter/material.dart';
import 'main_game.dart';

class FindRecipeDetail extends StatelessWidget {

  final MyStoreGame game;
  const FindRecipeDetail({super.key, required this.game});

  @override
  Widget build(BuildContext context) {

    final recipe = game.selectedRecipe!;
    final bool isUnlocked = recipe.completedCount > 0;
    final String ingredientsText = isUnlocked 
        ? recipe.ingredients.map((i) => i.name).join('、') 
        : '???';

    final String descriptionText = isUnlocked ? recipe.description : '???';
    final String statusTitle = isUnlocked ? '已收錄' : '尚未收錄';
    final String recordText = isUnlocked ? '已完成 ${recipe.completedCount} 次' : '已完成 0 次';

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.contain,
        child:Container(
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
                      recipe.name,
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
                  top: 560,
                  child: SizedBox(
                    width: 920,
                    child: Text(
                      '再次完成同一道菜會累計次數，收藏不會重複增加。',
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
                      game.overlays.remove('FindRecipeDetail');
                      game.overlays.add('FindRecipeMenu'); 
                    },
                    child: Container(
                      width: 200,
                      height: 76,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 200,
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
                                '回圖鑑',
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
                  top: 126,
                  child: Container(
                    width: 400,
                    height: 400,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 400,
                            height: 400,
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
                          left: 20,
                          top: 25,
                          child: Container(
                            width: 360,
                            height: 300,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(recipe.recipeImagePath),
                                fit: BoxFit.fill,
                                opacity: isUnlocked ? 1.0 : 0.4,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: 335,
                          child: SizedBox(
                            width: 330,
                            child: Text(
                              '第 ${recipe.id} 道拿手菜',
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 34 : 26,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 470,
                  top: 126,
                  child: Container(
                    width: 490,
                    height: 400,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 490,
                            height: 400,
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
                          left: 26,
                          top: 24,
                          child: SizedBox(
                            width: 400,
                            child: Text(
                              statusTitle,
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 38 : 30,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 26,
                          top: 88,
                          child: SizedBox(
                            width: 400,
                            child: Text(
                              '主要食材',
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 36 : 28,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 26,
                          top: 135,
                          child: SizedBox(
                            width: 420,
                            child: Text(
                              ingredientsText,
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 36 : 28,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 26,
                          top: 213,
                          child: SizedBox(
                            width: 400,
                            child: Text(
                              '完成紀錄',
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 36 : 28,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 26,
                          top: 260,
                          child: SizedBox(
                            width: 420,
                            child: Text(
                              recordText,
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 36 : 28,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 26,
                          top: 328,
                          child: SizedBox(
                            width: 420,
                            child: Text(
                              descriptionText,
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
                      ],
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