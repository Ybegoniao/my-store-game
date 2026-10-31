import 'package:flutter/material.dart';
import 'main_game.dart';
import 'recipe_data.dart'; 
import 'dart:async';
import 'dart:math';

class FindGameCard extends StatefulWidget {
  
  final MyStoreGame game;
  const FindGameCard({super.key, required this.game});
  
  @override
  State<FindGameCard> createState() => _FindGameCardState();
}

class _FindGameCardState extends State<FindGameCard> {

  static String? _lastOrderName;
  static List<Ingredient> gridItems = []; 
  static int foundCount = 0; 
  static List<bool?> gridStatus = [];
  static String currentFeedback = '';
  static bool? lastClickIsCorrect;

  int grandmaExpression = 0;
  int boyExpression = 0;
  Timer? _grandmaTimer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    final currentOrder = widget.game.currentOrder!;

    if (_lastOrderName != currentOrder.name) {
      _lastOrderName = currentOrder.name;
      foundCount = 0;
      gridStatus = List.filled(9, null);
      currentFeedback = '';
      lastClickIsCorrect = null;
      
      _generateGridItems();
    }

    void scheduleGrandmaNext() {
      if (grandmaExpression == 5) {
        int longWait = 4 + _random.nextInt(5); 
        _grandmaTimer = Timer(Duration(seconds: longWait), () {
          if (!mounted) return;
          setState(() {
            grandmaExpression = 0; 
          });
          scheduleGrandmaNext();
        });
      } else {
        int shortWait = 2 + _random.nextInt(3); 
        _grandmaTimer = Timer(Duration(seconds: shortWait), () {
          if (!mounted) return;
          setState(() {
            grandmaExpression = 5; 
          });
          scheduleGrandmaNext();
        });
      }
    }

    scheduleGrandmaNext();
  }

  @override
  void dispose() {
    _grandmaTimer?.cancel();
    super.dispose();
  }

  //生成九宮格
  void _generateGridItems() {
    final correctIngredients = widget.game.currentOrder!.ingredients;

    List<Ingredient> wrongIngredients = widget.game.allAvailableIngredients
        .where((i) => !correctIngredients.any((c) => c.name == i.name))
        .toList();
    
    wrongIngredients.shuffle(); 

    gridItems = [
      ...correctIngredients,
      ...wrongIngredients.take(6)
    ];
    gridItems.shuffle();
  }

  // 點擊格子
  void _onIngredientTap(int index) {
    if (gridStatus[index] != null) return;

    final clickedIngredient = gridItems[index];
    final orderIngredients = widget.game.currentOrder!.ingredients;
    final isCorrect = orderIngredients.any((i) => i.name == clickedIngredient.name);

    setState(() {
      lastClickIsCorrect = isCorrect;
      
      if (isCorrect) {
        gridStatus[index] = true;
        foundCount++;
        int leftCount = 3 - foundCount;

        grandmaExpression = 1;
        boyExpression = 1;
        
        if (leftCount > 0) {
          currentFeedback = '答對了！${clickedIngredient.name}找到了，再找 $leftCount 樣。';
        } else {
          currentFeedback = '太棒了！全部都找齊囉！';
          
          final finishedRecipe = widget.game.currentOrder!;
          widget.game.cookedDishes.add(finishedRecipe);

          bool isFirstTime = finishedRecipe.completedCount == 0;
          finishedRecipe.completedCount++;
          if (isFirstTime) {
            print("首次完成！解鎖新圖鑑！");
            widget.game.overlays.remove('FindGameCard');
            widget.game.overlays.add('FindRecipeFirstUnlock');
          } else {
            widget.game.overlays.remove('FindGameCard');
            widget.game.overlays.add('FindGameCook');
          }
        }
      } else {
        gridStatus[index] = false;

        grandmaExpression = 5;
        boyExpression = 0;
        
        final orderIngredients = widget.game.currentOrder!.ingredients;

        List<String> remainingIngredientNames = [];
        for (var ingredient in orderIngredients) {
          int gridIndex = gridItems.indexWhere((item) => item.name == ingredient.name);
          if (gridIndex != -1 && gridStatus[gridIndex] != true) {
            remainingIngredientNames.add(ingredient.name);
          }
        }
        String hintName = "";
        if (remainingIngredientNames.isNotEmpty) {
           remainingIngredientNames.shuffle();
           hintName = remainingIngredientNames.first;
        }
        if (hintName.isNotEmpty) {
           currentFeedback = '這是${clickedIngredient.name}喔，再找找看有沒有$hintName！';
        } else {
           currentFeedback = '這是${clickedIngredient.name}喔，再檢查看看！';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          width: 1000,
          height: 625,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
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
                            color: const Color(0xFFEBDAB6) /* color-wall */,
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
                            image: DecorationImage(
                              image: AssetImage("lib/assets/images/background_0.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Opacity(
                          opacity: 0.30,
                          child: Container(
                            width: 1000,
                            height: 625,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFDF5) /* color-card */,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 352,
                top: 494,
                child: SizedBox(
                  width: 580,
                  child: Text(
                    '點一下你覺得對的食材',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF4A3222) /* color-text */,
                      fontSize: widget.game.isLargeFont ? 34 : 26,
                      fontFamily: 'Noto Sans TC',
                      fontWeight: FontWeight.w500,
                      height: 1.50,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 456,
                top: 10,
                child: GestureDetector(
                  onTap: () {
                    widget.game.overlays.add('FindSettingMenu');
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
                            width: 200,
                            height: 76,
                            child: Text(
                              '設定',
                              style: TextStyle(
                                color: const Color(0xFF4A3222),
                                fontSize: widget.game.isLargeFont ? 38 : 30,
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
                left: 770,
                top: 10,
                child: GestureDetector(
                  onTap: () {
                    widget.game.overlays.add('FindRecipeMenu');
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
                            width: 200,
                            height: 76,
                            child: Text(
                              '菜品圖鑑',
                              style: TextStyle(
                                color: const Color(0xFF4A3222),
                                fontSize: widget.game.isLargeFont ? 38 : 30,
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
                left: 352,
                top: 108,
                child: SizedBox(
                  width: 600,
                  child: Wrap(
                    spacing: 14,
                    runSpacing: 14, 
                    children: List.generate(9, (index) {
                      final item = gridItems[index];
                      final status = gridStatus[index];
                      return GestureDetector(
                        onTap: () => _onIngredientTap(index),
                        child: Stack(
                          clipBehavior: Clip.none, 
                          children: [
                            Container(
                              width: 184,
                              height: 112,
                              decoration: ShapeDecoration(
                                color: status == true 
                                       ? const Color(0xFFDCEBD3) 
                                       : (status == false ? const Color(0xFFF3D5B5) : const Color(0xFFFFFDF5)),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: status == true ? 6 : 3,
                                    color: status == true 
                                           ? const Color(0xFF3F7A4A) 
                                           : (status == false ? const Color(0xFFB84E14) : const Color(0xFF7A5233)),
                                  ),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 63,
                                    top: 2,
                                    child: SizedBox(
                                      width: 58,
                                      height: 58,
                                      child: Image.asset(
                                        item.imagePath,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 64,
                                    width: 184,
                                    child: Text(
                                      item.name,
                                      textAlign: TextAlign.center,
                                      style:  TextStyle(
                                        color:const Color(0xFF4A3222),
                                        fontSize: widget.game.isLargeFont ? 34 : 30,
                                        fontFamily: 'Noto Serif TC',
                                        fontWeight: FontWeight.w700,
                                        height: 1.35,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            if (status != null)
                              Positioned(
                                right: -8, 
                                top: -10,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: status == true ? const Color(0xFF3F7A4A) : const Color(0xFFB84E14),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      status == true ? '✓' : '?',
                                      style: const TextStyle(
                                        color: Color(0xFFFFFDF5),
                                        fontSize: 24,
                                        fontFamily: 'Noto Sans TC',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 12,
                child: Container(
                  width: 318,
                  height: 72,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 318,
                          height: 72,
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
                                color: Color(0x2D4A3222),
                                blurRadius: 18,
                                offset: Offset(0, 6),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          right: 50,
                          top: -2,
                          child: Container(
                            width: 318,
                            height: 72,
                            alignment: Alignment.center,
                            child: Text(
                              '巷口柑仔店',
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: widget.game.isLargeFont ? 37 : 34,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 95,
                          child: Container(
                            width: 318,
                            height: 72,
                            alignment: Alignment.center,
                            child: Text(
                              '第 3 天',
                              style: TextStyle(
                                color: const Color(0xFFA9783F) /* color-wood */,
                                fontSize: widget.game.isLargeFont ? 30 : 26,
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
              Positioned(
                left: 24,
                top: 108,
                child: Container(
                  width: 300,
                  height: 492,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 300,
                          height: 492,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFFFDF5) /* color-card */,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 3,
                                color: const Color(0xFF7A5233) /* color-border */,
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x2D4A3222),
                                blurRadius: 18,
                                offset: Offset(0, 6),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28,
                        top: 17,
                        child: Text(
                          '今天的菜',
                          style: TextStyle(
                            color: const Color(0xFF7A5233) /* color-border */,
                            fontSize: widget.game.isLargeFont ? 30 : 22,
                            fontFamily: 'Noto Sans TC',
                            fontWeight: FontWeight.w500,
                            height: 1.45,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28,
                        top: 52,
                        child: Text(
                          widget.game.currentOrder?.name ?? '',
                          style: TextStyle(
                            color: const Color(0xFF4A3222) /* color-text */,
                            fontSize: widget.game.isLargeFont ? 50 : 44,
                            fontFamily: 'Noto Serif TC',
                            fontWeight: FontWeight.w700,
                            height: 1.30,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28,
                        top: 122,
                        child: Text(
                          '還要找 ${3 - foundCount} 樣',
                          style: TextStyle(
                            color: const Color(0xFF4A3222) /* color-text */,
                            fontSize: widget.game.isLargeFont ? 38 : 30,
                            fontFamily: 'Noto Sans TC',
                            fontWeight: FontWeight.w500,
                            height: 1.50,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 176,
                        child: Row(
                          children: List.generate(3, (index) {
                            bool isFound = index < foundCount;
                            return Container(
                              margin: const EdgeInsets.only(right: 12), 
                              width: 30,
                              height: 30,
                              decoration: ShapeDecoration(
                                color: isFound ? const Color(0xFF3F7A4A) : const Color(0xFFFFFDF5),
                                shape: OvalBorder(
                                  side: BorderSide(
                                    width: 3,
                                    color: isFound ? const Color(0xFF3F7A4A) : const Color(0xFF7A5233),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Positioned(
                        left: 84.88,
                        top: 325.86,
                        child: Container(
                          width: 130.24,
                          height: 156.14,
                          child: Image.asset(
                            'lib/assets/images/grandma_$grandmaExpression.png', 
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28,
                        top: 228,
                        child: Container(
                          width: 244,
                          height: 76,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 244,
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
                                    '看提示',
                                    style: TextStyle(
                                      color: const Color(0xFF4A3222) /* color-text */,
                                      fontSize: widget.game.isLargeFont ? 38 : 30,
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
                    ],
                  ),
                ),
              ),

              // 孫子的提示框 (有文字時才顯示)
              if (currentFeedback.isNotEmpty)
                Positioned(
                  left: 352,
                  top: 486,
                  child: Container(
                    width: 580,
                    height: 123,
                    decoration: ShapeDecoration(
                      // 對的時候綠底，錯的時候橘底
                      color: lastClickIsCorrect == true 
                             ? const Color(0xFFDCEBD3) 
                             : const Color(0xFFF3D5B5),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 3,
                          color: lastClickIsCorrect == true 
                                 ? const Color(0xFF3F7A4A) 
                                 : const Color(0xFFB84E14),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x2D4A3222),
                          blurRadius: 18,
                          offset: Offset(0, 6),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        // 👇 關鍵修正：拔掉 Positioned，直接用 Container，並用 margin 替代 left 和 top
                        Container(
                          margin: const EdgeInsets.only(left: 10, top: 7, right: 15), 
                          width: 96.72,
                          height: 115.94,
                          child: Image.asset(
                            'lib/assets/images/boy_$boyExpression.png', 
                            fit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            currentFeedback,
                            style: TextStyle(
                              color: const Color(0xFF4A3222),
                              fontSize: widget.game.isLargeFont ? 30 : 22,
                              fontFamily: 'Noto Sans TC',
                              fontWeight: FontWeight.w700,
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