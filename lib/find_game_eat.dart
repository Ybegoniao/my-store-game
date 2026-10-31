import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'main_game.dart';
import 'dart:async';
import 'dart:math';

class FindGameEat extends StatefulWidget {

  final MyStoreGame game;
  const FindGameEat({super.key, required this.game});

  @override
  State<FindGameEat> createState() => _FindGameEatState();
}

class _FindGameEatState extends State<FindGameEat> {
  int grandmaExpression = 0;
  int boyExpression = 0;

  Timer? _grandmaTimer;
  Timer? _boyTimer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    
    void scheduleGrandmaNext() {
      if (grandmaExpression == 0) {
        int longWait = 3 + _random.nextInt(5); 
        _grandmaTimer = Timer(Duration(seconds: longWait), () {
          if (!mounted) return;
          setState(() {
            grandmaExpression = 1; 
          });
          scheduleGrandmaNext();
        });
      } else {
        int shortWait = 1 + _random.nextInt(2); 
        _grandmaTimer = Timer(Duration(seconds: shortWait), () {
          if (!mounted) return;
          setState(() {
            grandmaExpression = 0; 
          });
          scheduleGrandmaNext();
        });
      }
    }

    void scheduleBoyNext() {
      if (boyExpression == 0) {
        int longWait = 3 + _random.nextInt(5); 
        _boyTimer = Timer(Duration(seconds: longWait), () {
          if (!mounted) return;
          setState(() {
            boyExpression = 3; 
          });
          scheduleBoyNext();
        });
      } else {
        int shortWait = 1 + _random.nextInt(2); 
        _boyTimer = Timer(Duration(seconds: shortWait), () {
          if (!mounted) return;
          setState(() {
            boyExpression = 0; 
          });
          scheduleBoyNext();
        });
      }
    }

    scheduleGrandmaNext();
    scheduleBoyNext();
  }

  @override
  void dispose() {
    _grandmaTimer?.cancel();
    _boyTimer?.cancel();
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
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 330,
                  child: Container(
                    width: 235,
                    height: 282,
                    child: Image.asset(
                      'lib/assets/images/grandma_$grandmaExpression.png', 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 690,
                  top: 361,
                  child: Container(
                    width: 210,
                    height: 251,
                    child: Image.asset(
                      'lib/assets/images/boy_$boyExpression.png', 
                      fit: BoxFit.contain,
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
                  left: 335,
                  top: 401,
                  child: GestureDetector(
                    onTap: () {
                      widget.game.overlays.remove('FindGameEat');
                      widget.game.overlays.add('FindGameMemorize'); 
                      dispose();
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
                                '好，阿嬤來煮',
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
                Positioned(
                  left: 250,
                  top: 170,
                  child: Container(
                    width: 470,
                    height: 203,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 470,
                            height: 203,
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
                          left: 35,
                          top: 25,
                          child: Container(
                            width: 88,
                            height: 47,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFA9783F) /* color-wood */,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(999),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 35,
                          top: 25,
                          child: Container(
                            width: 88,
                            height: 47,
                            alignment: Alignment.center,
                            child: Text(
                              '孫子',
                              style: TextStyle(
                                color: const Color(0xFFFFFDF5) /* color-card */,
                                fontSize: widget.game.isLargeFont ? 30 : 26,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w700,
                                height: 1.50,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 35,
                          top: 82,
                          child: SizedBox(
                            width: 400,
                            child: Text(
                              '阿嬤，我回來了！\n今天想吃「${widget.game.currentOrder?.name ?? ""}」～',
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: widget.game.isLargeFont ? 35 : 30,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
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
              ],
            ),
          ),
      ),
    );
  }
}