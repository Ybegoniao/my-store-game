import 'package:flutter/material.dart';
import 'main_game.dart';

class FindRecipeFirstUnlock extends StatelessWidget {
  final MyStoreGame game;
  const FindRecipeFirstUnlock({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    // 取得當前完成的食譜資料
    final currentRecipe = game.currentOrder!;

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
                            decoration: const BoxDecoration(
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
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFFDF5) /* color-card */,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                Positioned(
                  left: 120,
                  top: 28,
                  child: Container(
                    width: 760,
                    height: 570,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 760,
                            height: 570,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFFFDF5) /* color-card */,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 2,
                                  color: Color(0xFF7A5233) /* color-border */,
                                ),
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0, 
                          top: 40, 
                          child: SizedBox(
                            width: 760, 
                            child: Text(
                              '又多一道拿手菜！',
                              textAlign: TextAlign.center, 
                              style: TextStyle(
                                color:const Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 50 : 44,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                                height: 1.30,
                              ),
                            ),
                          ),
                        ),
                        
                        Positioned(
                          left: 220,
                          top: 100,
                          child: Container(
                            width: 320,
                            height: 230,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(currentRecipe.recipeImagePath),
                                fit: BoxFit.contain, 
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                        
                        Positioned(
                          left: 0, 
                          top: 338,
                          child: SizedBox(
                            width: 760,
                            child: Text(
                              currentRecipe.name,
                              textAlign: TextAlign.center, 
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 44 : 36,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 396,
                          child: SizedBox(
                            width: 760,
                            child: Text(
                              '已自動收錄到「我的拿手菜」',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 36 : 28,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                          ),
                        ),
                        
                        Positioned(
                          left: 58,
                          top: 466,
                          child: GestureDetector(
                            onTap: () {
                              game.overlays.add('FindRecipeMenu'); 
                            },
                            child: Container(
                              width: 300,
                              height: 76,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 300,
                                      height: 76,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFB84E14) /* color-primary */,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        shadows: const [
                                          BoxShadow(color: Color(0xFF7A5233), offset: Offset(0, 5))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '查看圖鑑',
                                        style: TextStyle(
                                          color: Color(0xFFFFFDF5) /* color-card */,
                                          fontSize: game.isLargeFont ? 38 : 30,
                                          fontFamily: 'Noto Sans TC',
                                          fontWeight: FontWeight.w700,
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
                          left: 400,
                          top: 466,
                          child: GestureDetector(
                            onTap: () {
                              game.overlays.remove('FindRecipeFirstUnlock');
                              game.overlays.add('FindGameCook'); 
                            },
                            child: Container(
                              width: 300,
                              height: 76,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 300,
                                      height: 76,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFFFFDF5) /* color-card */,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(width: 3, color: Color(0xFF7A5233)),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        shadows: const [
                                          BoxShadow(color: Color(0xFF7A5233), offset: Offset(0, 5))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '繼續日常',
                                        style: TextStyle(
                                          color: Color(0xFF4A3222) /* color-text */,
                                          fontSize: game.isLargeFont ? 38 : 30,
                                          fontFamily: 'Noto Sans TC',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    
                                  ),
                                ],
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