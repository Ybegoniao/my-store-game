import 'package:flutter/material.dart';
import 'main_game.dart';
import 'dart:async';
import 'dart:math';

class FindGameCook extends StatefulWidget {

  final MyStoreGame game;
  const FindGameCook({super.key, required this.game});

  @override
  State<FindGameCook> createState() => _FindGameCookState();
}


class _FindGameCookState extends State<FindGameCook> {
  int grandmaExpression = 0;
  int boyExpression = 1;

  String currentPraise = '';

  Timer? _grandmaTimer;
  Timer? _boyTimer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    List<String> praiseList = [
      '好好吃喔！\n阿嬤最棒了！',
      '哇！好香喔！\n肚子好餓！',
      '看起來好好吃！\n謝謝阿嬤！',
      '我最喜歡吃\n阿嬤煮的菜！'
    ];
    currentPraise = praiseList[_random.nextInt(praiseList.length)];
    
    void scheduleGrandmaNext() {
      if (grandmaExpression == 1) {
        int longWait = 3 + _random.nextInt(5); 
        _grandmaTimer = Timer(Duration(seconds: longWait), () {
          if (!mounted) return;
          setState(() {
            grandmaExpression = 0; 
          });
          scheduleGrandmaNext();
        });
      } else {
        int shortWait = 2 + _random.nextInt(2); 
        _grandmaTimer = Timer(Duration(seconds: shortWait), () {
          if (!mounted) return;
          setState(() {
            grandmaExpression = 1; 
          });
          scheduleGrandmaNext();
        });
      }
    }

    void scheduleBoyNext() {
      if (boyExpression == 1) {
        int longWait = 5 + _random.nextInt(5); 
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
            boyExpression = 1; 
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

    final currentOrder = widget.game.currentOrder;

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
                            opacity: 0.35,
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
                  left: 26,
                  top: 390.45,
                  child: Container(
                    width: 184.80,
                    height: 221.55,
                    child: Image.asset(
                      'lib/assets/images/grandma_$grandmaExpression.png', 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 760,
                  top: 378.25,
                  child: Container(
                    width: 195,
                    height: 233.75,
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
                  left: 678,
                  top: 108,
                  child: Container(
                    width: 306,
                    height: 203,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 306,
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
                          top: 75,
                          child: SizedBox(
                            width: 236,
                            child: Text(
                              currentPraise,
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
                Positioned(
                  left: 205,
                  top: 112,
                  child: Container(
                    width: 473,
                    height: 480,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 470,
                            height: 480,
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
                          top: 25,
                          child: SizedBox(
                            width: 470,
                            child: Text(
                              '上菜囉！',
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
                          left: 125,
                          top: 92,
                          child: Container(
                            width: 220,
                            height: 220,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(currentOrder!.dishImagePath),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 3,
                          top: 307,
                          child: SizedBox(
                            width: 470,
                            child: Text(
                              currentOrder!.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: widget.game.isLargeFont ? 42 : 34,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ),
                        if (currentOrder.completedCount == 1)
                          Positioned(
                            left: 28,
                            top: 355,
                            child: SizedBox(
                              width: 420,
                              child: Text(
                                '新菜色已收錄・查看圖鑑',
                                style: TextStyle(
                                  color: const Color(0xFF3F7A4A) /* color-success */,
                                  fontSize: widget.game.isLargeFont ? 24 : 22,
                                  fontFamily: 'Noto Sans TC',
                                  fontWeight: FontWeight.w500,
                                  height: 1.45,
                                ),
                              ),
                            ),
                          ),
                        Positioned(
                          left: 24,
                          top: 386,
                          child: GestureDetector(
                            onTap: () {
                              widget.game.generateNewOrder(); 
                              widget.game.overlays.remove('FindGameCook');
                              widget.game.overlays.add('FindGameEat'); 
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
                                        '煮下一道',
                                        style: TextStyle(
                                          color: const Color(0xFFFFFDF5) /* color-card */,
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
                          left: 242,
                          top: 386,
                          child: GestureDetector(
                            onTap: () {
                              widget.game.generateNewOrder(); 
                              widget.game.overlays.remove('FindGameCook');
                              widget.game.overlays.add('FindGameRelax'); 
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
                                        '休息一下',
                                        style: TextStyle(
                                          color: const Color(0xFF4A3222) /* color-text */,
                                          fontSize: widget.game.isLargeFont ? 38 : 30,
                                          fontFamily: 'Noto Sans TC',
                                          fontWeight: FontWeight.w700
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