import 'package:flutter/material.dart';
import 'main_game.dart';
import 'dart:async';
import 'dart:math';

class FindGameRelax extends StatefulWidget {

  final MyStoreGame game;
  const FindGameRelax({super.key, required this.game});

  @override
  State<FindGameRelax> createState() => _FindGameRelaxState();
}


class _FindGameRelaxState extends State<FindGameRelax> {
  int grandpaExpression = 0;
  int neighborExpression = 0;

  Timer? _grandpaTimer;
  Timer? _neighborTimer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    
    void scheduleGrandpaNext() {
      if (grandpaExpression == 1) {
        int longWait = 5 + _random.nextInt(5); 
        _grandpaTimer = Timer(Duration(seconds: longWait), () {
          if (!mounted) return;
          setState(() {
            grandpaExpression = 0; 
          });
          scheduleGrandpaNext();
        });
      } else {
        int shortWait = 1 + _random.nextInt(2); 
        _grandpaTimer = Timer(Duration(seconds: shortWait), () {
          if (!mounted) return;
          setState(() {
            grandpaExpression = 1; 
          });
          scheduleGrandpaNext();
        });
      }
    }

    void scheduleNeighborNext() {
      if (neighborExpression == 0) {
        int longWait = 5 + _random.nextInt(5); 
        _neighborTimer = Timer(Duration(seconds: longWait), () {
          if (!mounted) return;
          setState(() {
            neighborExpression = 1; 
          });
          scheduleNeighborNext();
        });
      } else {
        int shortWait = 1 + _random.nextInt(2); 
        _neighborTimer = Timer(Duration(seconds: shortWait), () {
          if (!mounted) return;
          setState(() {
            neighborExpression = 0; 
          });
          scheduleNeighborNext();
        });
      }
    }

    scheduleGrandpaNext();
    scheduleNeighborNext();
  }

  @override
  void dispose() {
    _grandpaTimer?.cancel();
    _neighborTimer?.cancel();
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
                            opacity: 0.25,
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
                  left: 610,
                  top: 450,
                  child: Container(
                    width: 260,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("lib/assets/images/icon_table.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 470,
                  top: 325.52,
                  child: Container(
                    width: 237.44,
                    height: 284.48,
                    child: Image.asset(
                      'lib/assets/images/grandpa_$grandpaExpression.png', 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 760,
                  top: 335.60,
                  child: Container(
                    width: 228.48,
                    height: 274.40,
                    child: Image.asset(
                      'lib/assets/images/neighbor_$neighborExpression.png', 
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
                  left: 590,
                  top: 120,
                  child: Container(
                    width: 380,
                    height: 158,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 380,
                            height: 158,
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
                            width: 140,
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
                            width: 140,
                            height: 47,
                            alignment: Alignment.center,
                            child: Text(
                              '鄰居阿伯',
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
                            width: 390,
                            child: Text(
                              '來來來，坐下喝杯茶！',
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: widget.game.isLargeFont ? 33 : 30,
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
                  left: 36,
                  top: 108,
                  child: Container(
                    width: 420,
                    height: 480,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 420,
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
                          left: 40,
                          top: 30,
                          child: SizedBox(
                            width: 340,
                            child: Text(
                              '喝杯茶，\n休息一下',
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
                          left: 40,
                          top: 165,
                          child: SizedBox(
                            width: 390,
                            child: Text(
                              '阿公和鄰居阿伯在泡茶，\n要不要一起坐坐？',
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: widget.game.isLargeFont ? 33 : 30,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 272,
                          child: GestureDetector(
                            onTap: () {
                              widget.game.generateNewOrder(); 
                              widget.game.overlays.remove('FindGameRelax');
                              widget.game.overlays.add('FindGameEat'); 
                              dispose();
                            },
                            child: Container(
                              width: 340,
                              height: 76,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 340,
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
                                        '繼續煮菜',
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
                          left: 40,
                          top: 362,
                          child: GestureDetector(
                            onTap: () { 
                              widget.game.overlays.remove('FindGameRelax');
                              widget.game.overlays.add('FindGameFinish'); 
                              dispose();
                            },
                            child: Container(
                              width: 340,
                              height: 76,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 340,
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
                                        '今天到這裡',
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