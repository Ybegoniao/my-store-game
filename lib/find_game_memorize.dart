import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'main_game.dart';
import 'dart:async';
import 'dart:math';

class FindGameMemorize extends StatefulWidget {

  final MyStoreGame game;
  const FindGameMemorize({super.key, required this.game});

  @override
  State<FindGameMemorize> createState() => _FindGameMemorizeState();
}


class _FindGameMemorizeState extends State<FindGameMemorize> {
  int grandmaExpression = 0;

  Timer? _grandmaTimer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    
    void scheduleGrandmaNext() {
      if (grandmaExpression == 0) {
        int longWait = 5 + _random.nextInt(5); 
        _grandmaTimer = Timer(Duration(seconds: longWait), () {
          if (!mounted) return;
          setState(() {
            grandmaExpression = 3; 
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

    scheduleGrandmaNext();
  }

  @override
  void dispose() {
    _grandmaTimer?.cancel();
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
                  top: 401,
                  child: Container(
                    width: 176,
                    height: 211,
                    child: Image.asset(
                      'lib/assets/images/grandma_$grandmaExpression.png', 
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
                  left: 230,
                  top: 116,
                  child: Container(
                    width: 730,
                    height: 470,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 730,
                            height: 470,
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
                          top: 40,
                          child: SizedBox(
                            width: 730,
                            child: Text(
                              '${widget.game.currentOrder?.name ?? ""}要用這些：',
                              textAlign: TextAlign.center,
                              style:  TextStyle(
                                color:const Color(0xFF4A3222),
                                fontSize: widget.game.isLargeFont ? 50 : 44,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                                height: 1.30,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 315,
                          child: SizedBox(
                            width: 730,
                            child: Text(
                              '記好了再按，慢慢來沒關係。',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF7A5233) /* color-border */,
                                fontSize: widget.game.isLargeFont ? 34 : 26,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 185,
                          top: 368,
                          child: GestureDetector(
                            onTap: () {
                              widget.game.overlays.remove('FindGameMemorize');
                              widget.game.overlays.add('FindGameCard');
                              dispose();
                            },
                            child: Container(
                              width: 360,
                              height: 76,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 360,
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
                                        '記住了，開始找',
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
                          left: 52,
                          top: 132,
                          child: Container(
                            width: 190,
                            height: 150,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 190,
                                    height: 150,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFFFFDF5) /* color-card */,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 3,
                                          color: const Color(0xFF7A5233) /* color-border */,
                                        ),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 66,
                                  top: 21,
                                  child: Container(
                                    width: 58,
                                    height: 58,
                                    child: Image.asset(
                                      widget.game.currentOrder!.ingredients[0].imagePath, 
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 83,
                                  width: 190,
                                  child: Text(
                                    '${widget.game.currentOrder?.ingredients[0].name ?? ""}',
                                    style: TextStyle(
                                      color: const Color(0xFF4A3222) /* color-text */,
                                      fontSize: widget.game.isLargeFont ? 42 : 34,
                                      fontFamily: 'Noto Serif TC',
                                      fontWeight: FontWeight.w700,
                                      height: 1.35,
                                    ),
                                  textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 270,
                          top: 132,
                          child: Container(
                            width: 190,
                            height: 150,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 190,
                                    height: 150,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFFFFDF5) /* color-card */,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 3,
                                          color: const Color(0xFF7A5233) /* color-border */,
                                        ),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 66,
                                  top: 21,
                                  child: Container(
                                    width: 58,
                                    height: 58,
                                    child: Image.asset(
                                      widget.game.currentOrder!.ingredients[1].imagePath, 
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 83,
                                  width: 190,
                                  child: Text(
                                    '${widget.game.currentOrder?.ingredients[1].name ?? ""}',
                                    style: TextStyle(
                                      color: const Color(0xFF4A3222) /* color-text */,
                                      fontSize: widget.game.isLargeFont ? 42 : 34,
                                      fontFamily: 'Noto Serif TC',
                                      fontWeight: FontWeight.w700,
                                      height: 1.35,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 488,
                          top: 132,
                          child: Container(
                            width: 190,
                            height: 150,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 190,
                                    height: 150,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFFFFDF5) /* color-card */,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 3,
                                          color: const Color(0xFF7A5233) /* color-border */,
                                        ),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 66,
                                  top: 21,
                                  child: Container(
                                    width: 58,
                                    height: 58,
                                    child: Image.asset(
                                      widget.game.currentOrder!.ingredients[2].imagePath, 
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 83,
                                  width: 190,
                                  child: Text(
                                    '${widget.game.currentOrder?.ingredients[2].name ?? ""}',
                                    style: TextStyle(
                                      color: const Color(0xFF4A3222) /* color-text */,
                                      fontSize: widget.game.isLargeFont ? 42 : 34,
                                      fontFamily: 'Noto Serif TC',
                                      fontWeight: FontWeight.w700,
                                      height: 1.35,
                                    ),
                                    textAlign: TextAlign.center,
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
              ],
            ),
          ),
      ),
    );
  }
}