import 'package:flutter/material.dart';
import 'main_game.dart';
import 'dart:async';
import 'dart:math';

class FindGameFinish extends StatefulWidget {

  final MyStoreGame game;
  const FindGameFinish({super.key, required this.game});

  @override
  State<FindGameFinish> createState() => _FindGameFinishState();
}

class _FindGameFinishState extends State<FindGameFinish> {
  int oneExpression = 1;
  int twoExpression = 0;

  Timer? _oneTimer;
  Timer? _twoTimer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    
    void scheduleOneNext() {
      if (oneExpression == 1) {
        int longWait = 6 + _random.nextInt(5); 
        _oneTimer = Timer(Duration(seconds: longWait), () {
          if (!mounted) return;
          setState(() {
            oneExpression = 0; 
          });
          scheduleOneNext();
        });
      } else {
        int shortWait = 2 + _random.nextInt(2); 
        _oneTimer = Timer(Duration(seconds: shortWait), () {
          if (!mounted) return;
          setState(() {
            oneExpression = 1; 
          });
          scheduleOneNext();
        });
      }
    }

    void scheduleTwoNext() {
      if (twoExpression == 0) {
        int longWait = 4 + _random.nextInt(4); 
        _twoTimer = Timer(Duration(seconds: longWait), () {
          if (!mounted) return;
          setState(() {
            twoExpression = 1; 
          });
          scheduleTwoNext();
        });
      } else {
        int shortWait = 2 + _random.nextInt(3); 
        _twoTimer = Timer(Duration(seconds: shortWait), () {
          if (!mounted) return;
          setState(() {
            twoExpression = 0; 
          });
          scheduleTwoNext();
        });
      }
    }

    scheduleOneNext();
    scheduleTwoNext();
  }

  @override
  void dispose() {
    _oneTimer?.cancel();
    _twoTimer?.cancel();
    super.dispose();
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
                            opacity: 0.45,
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
                  left: 95.28,
                  top: 436.54,
                  child: Container(
                    width: 151.36,
                    height: 181.46,
                    child: Image.asset(
                      'lib/assets/images/grandma_$oneExpression.png', 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 254.64,
                  top: 399.56,
                  child: Container(
                    width: 182.32,
                    height: 218.44,
                    child: Image.asset(
                      'lib/assets/images/grandpa_$twoExpression.png', 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 444.96,
                  top: 457.18,
                  child: Container(
                    width: 134.16,
                    height: 160.82,
                    child: Image.asset(
                      'lib/assets/images/boy_$twoExpression.png', 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 587.12,
                  top: 457.18,
                  child: Container(
                    width: 134.16,
                    height: 160.82,
                    child: Image.asset(
                      'lib/assets/images/girl_$oneExpression.png', 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 729.28,
                  top: 407.30,
                  child: Container(
                    width: 175.44,
                    height: 210.70,
                    child: Image.asset(
                      'lib/assets/images/neighbor_$twoExpression.png', 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 760,
                  top: 530,
                  child: GestureDetector(
                    onTap: () {
                      widget.game.overlays.add('FindRecipeMenu'); 
                    },
                    child: Container(
                      width: 220,
                      height: 76,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 220,
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
                            left: 10,
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
                  left: 120,
                  top: 22,
                  child: Container(
                    width: 760,
                    height: 370,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 760,
                            height: 370,
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
                          left: 0,
                          top: 22,
                          child: SizedBox(
                            width: 760,
                            child: Text(
                              '今天辛苦了！',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: widget.game.isLargeFont ? 50 : 44,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                                height: 1.30,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 82,
                          child: SizedBox(
                            width: 760,
                            child: Text(
                              '今天煮了 ${widget.game.cookedDishes.length} 道菜，孫子吃得好開心。',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: widget.game.isLargeFont ? 38 : 30,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: 135,
                          child: SizedBox(
                            width: 700,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(minWidth: 700),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: widget.game.cookedDishes.map((recipe) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30), 
                                      child: Column(
                                        children: [
                                          // 料理圖片
                                          Container(
                                            width: 100,
                                            height: 100,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFFFFDF5),
                                            ),
                                            child: Image.asset(recipe.dishImagePath, fit: BoxFit.contain),
                                          ),
                                          const SizedBox(height: 10),
                                          // 料理名稱
                                          Text(
                                            recipe.name,
                                            style:  TextStyle(
                                              color: const Color(0xFF4A3222),
                                              fontSize: widget.game.isLargeFont ? 30 : 25,
                                              fontFamily: 'Noto Serif TC',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 240,
                          top: 288,
                          child: GestureDetector(
                            onTap: () {
                              widget.game.cookedDishes.clear();
                              widget.game.currentDay++; 
                              
                              widget.game.overlays.remove('FindGameFinish');
                              widget.game.overlays.add('MainMenu');
                            },
                            child: Container(
                              width: 270,
                              height: 66,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 270,
                                      height: 66,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFB84E14) /* color-primary */,
                                        shape: RoundedRectangleBorder(
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
                                        '明天見',
                                        style: TextStyle(
                                          color: const Color(0xFFFFFDF5) /* color-card */,
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