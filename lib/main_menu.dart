import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'main_game.dart';
import 'dart:async';
import 'dart:math';

class MainMenu extends StatefulWidget {
  
  final MyStoreGame game;
  const MainMenu({super.key, required this.game});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
        int longWait = 15 + _random.nextInt(10); 
        _grandmaTimer = Timer(Duration(seconds: longWait), () {
          if (!mounted) return;
          setState(() {
            grandmaExpression = _random.nextBool() ? 1 : 3; 
          });
          scheduleGrandmaNext();
        });
      } else {
        int shortWait = 1 + _random.nextInt(1); 
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
        int longWait = 15 + _random.nextInt(10); 
        _boyTimer = Timer(Duration(seconds: longWait), () {
          if (!mounted) return;
          setState(() {
            boyExpression = _random.nextBool() ? 1 : 3; 
          });
          scheduleBoyNext();
        });
      } else {
        int shortWait = 1 + _random.nextInt(1); 
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
                  left: 565,
                  top: 336.25,
                  child: Container(
                    width: 220,
                    height: 263.75,
                    child: Image.asset(
                      'lib/assets/images/grandma_$grandmaExpression.png', 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 776,
                  top: 357,
                  child: Container(
                    width: 195,
                    height: 233.75,
                    child: Image.asset(
                      'lib/assets/images/boy_$boyExpression.png', 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),


                //設定按鈕
                Positioned(
                  left: 776,
                  top: 20,
                  child: GestureDetector(
                    onTap: () {
                      print("點擊了設定"); 
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
                                color: const Color(0xFFFFFDF5),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 3, color: const Color(0xFF7A5233)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadows: [
                                  BoxShadow(color: Color(0xFF7A5233), offset: Offset(0, 5))
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
                  left: 56,
                  top: 79,
                  child: Container(
                    width: 500,
                    height: 467,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 500,
                            height: 467,
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
                          left: 48,
                          top: 52,
                          child: Text(
                            '巷口柑仔店',
                            style: TextStyle(
                              color: const Color(0xFF4A3222) /* color-text */,
                              fontSize: widget.game.isLargeFont ? 72 : 64,
                              fontFamily: 'Noto Serif TC',
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 48,
                          top: 150,
                          child: SizedBox(
                            width: 450,
                            child: Text(
                              '今天，也來店裡坐坐吧。',
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: widget.game.isLargeFont ? 38 : 30,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),


                        //開店囉按鈕
                        Positioned(
                          left: 48,
                          top: 245,
                          child: GestureDetector(
                            onTap: () {
                              widget.game.generateNewOrder();

                              widget.game.overlays.remove('MainMenu');
                              widget.game.overlays.add('FindGameEat');

                              dispose();
                            },
                            child: Container(
                              width: 404,
                              height: 76,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 404,
                                      height: 76,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFB84E14),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        shadows: [
                                          BoxShadow(color: Color(0xFF7A5233), offset: Offset(0, 5))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '開店囉',
                                        style: TextStyle(
                                          color: const Color(0xFFFFFDF5),
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


                        // 怎麼玩按鈕
                        Positioned(
                          left: 48,
                          top: 339,
                          child: GestureDetector(
                            onTap: () {
                              widget.game.overlays.remove('MainMenu');
                              widget.game.overlays.add('FindTutorialMenu'); 

                              dispose();
                            },
                            child: Container(
                              width: 404,
                              height: 76,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 404,
                                      height: 76,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFFFFDF5),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(width: 3, color: const Color(0xFF7A5233)),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        shadows: [
                                          BoxShadow(color: Color(0xFF7A5233), offset: Offset(0, 5))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '怎麼玩',
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