import 'package:flutter/material.dart';
import 'main_game.dart';

class FindTutorialMenu extends StatelessWidget {

  final MyStoreGame game;
  const FindTutorialMenu({super.key, required this.game});

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
                            opacity: 0.55,
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
                  left: 0,
                  top: 34,
                  child: SizedBox(
                    width: 1000,
                    child: Text(
                      '怎麼玩？',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF4A3222) /* color-text */,
                        fontSize: game.isLargeFont ? 52 : 44,
                        fontFamily: 'Noto Serif TC',
                        fontWeight: FontWeight.w700,
                        height: 1.30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 470,
                  child: SizedBox(
                    width: 1000,
                    child: Text(
                      '慢慢來，沒有時間限制，也不會扣分。',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF3F7A4A) /* color-success */,
                        fontSize: game.isLargeFont ? 34 : 26,
                        fontFamily: 'Noto Sans TC',
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 350,
                  top: 528,
                  child: GestureDetector(
                    onTap: () {
                      game.overlays.remove('FindTutorialMenu');
                      game.overlays.add('MainMenu');
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
                              '我知道了',
                              style: TextStyle(
                                color: const Color(0xFFFFFDF5) /* color-card */,
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
                  left: 60,
                  top: 120,
                  child: Container(
                    width: 280,
                    height: 340,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 280,
                            height: 340,
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
                          left: 24,
                          top: 22,
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFB84E14) /* color-primary */,
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 22,
                          child: Container(
                            width: 56,
                            height: 56,
                            alignment: Alignment.center,
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: const Color(0xFFFFFDF5) /* color-card */,
                                fontSize: game.isLargeFont ? 38 : 30,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 85.40,
                          top: 89.10,
                          child: Container(
                            width: 109.20,
                            height: 130.90,
                            child: Image.asset(
                              'lib/assets/images/boy_0.png', 
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 236,
                          child: SizedBox(
                            width: 232,
                            child: Text(
                              '孫子點菜',
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 42 : 34,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 288,
                          child: SizedBox(
                            width: 282,
                            child: Text(
                              '聽聽看今天想吃什麼。',
                              style: TextStyle(
                                color: const Color(0xFF7A5233) /* color-border */,
                                fontSize: game.isLargeFont ? 24 : 22,
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
                Positioned(
                  left: 360,
                  top: 120,
                  child: Container(
                    width: 280,
                    height: 340,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 280,
                            height: 340,
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
                          left: 24,
                          top: 22,
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFB84E14) /* color-primary */,
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 22,
                          child: Container(
                            width: 56,
                            height: 56,
                            alignment: Alignment.center,
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: const Color(0xFFFFFDF5) /* color-card */,
                                fontSize: game.isLargeFont ? 38 : 30,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          top: 120,
                          child: SizedBox(
                            width: 52,
                            height: 52,
                            child: Image.asset(
                              "lib/assets/images/food_tomato.png",
                              fit: BoxFit.contain, 
                            ),
                          ),
                        ),
                        Positioned(
                          left: 116,
                          top: 120,
                          child: SizedBox(
                            width: 52,
                            height: 52,
                            child: Image.asset(
                              "lib/assets/images/food_egg.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 182,
                          top: 120,
                          child: SizedBox(
                            width: 52,
                            height: 52,
                            child: Image.asset(
                              "lib/assets/images/food_green_onion.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 236,
                          child: SizedBox(
                            width: 232,
                            child: Text(
                              '記住食材',
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 42 : 34,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 288,
                          child: SizedBox(
                            width: 252,
                            child: Text(
                              '記好了再按，不用急。',
                              style: TextStyle(
                                color: const Color(0xFF7A5233) /* color-border */,
                                fontSize: game.isLargeFont ? 24 : 22,
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
                Positioned(
                  left: 660,
                  top: 120,
                  child: Container(
                    width: 280,
                    height: 340,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 280,
                            height: 340,
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
                          left: 24,
                          top: 22,
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFB84E14) /* color-primary */,
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 22,
                          child: Container(
                            width: 56,
                            height: 56,
                            alignment: Alignment.center,
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: const Color(0xFFFFFDF5) /* color-card */,
                                fontSize: game.isLargeFont ? 38 : 30,
                                fontFamily: 'Noto Sans TC',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 70,
                          top: 90,
                          child: Container(
                            width: 42,
                            height: 34,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFFFDF5) /* color-card */,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: const Color(0xFF7A5233) /* color-border */,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120,
                          top: 90,
                          child: Container(
                            width: 42,
                            height: 34,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFFFDF5) /* color-card */,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: const Color(0xFF7A5233) /* color-border */,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 170,
                          top: 90,
                          child: Container(
                            width: 42,
                            height: 34,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFFFDF5) /* color-card */,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: const Color(0xFF7A5233) /* color-border */,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 70,
                          top: 132,
                          child: Container(
                            width: 42,
                            height: 34,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFFFDF5) /* color-card */,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: const Color(0xFF7A5233) /* color-border */,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120,
                          top: 132,
                          child: Container(
                            width: 42,
                            height: 34,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFDCEBD3) /* color-success-light */,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 4,
                                  color: const Color(0xFF3F7A4A) /* color-success */,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 170,
                          top: 132,
                          child: Container(
                            width: 42,
                            height: 34,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFFFDF5) /* color-card */,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: const Color(0xFF7A5233) /* color-border */,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 70,
                          top: 174,
                          child: Container(
                            width: 42,
                            height: 34,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFFFDF5) /* color-card */,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: const Color(0xFF7A5233) /* color-border */,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120,
                          top: 174,
                          child: Container(
                            width: 42,
                            height: 34,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFFFDF5) /* color-card */,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: const Color(0xFF7A5233) /* color-border */,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 170,
                          top: 174,
                          child: Container(
                            width: 42,
                            height: 34,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFFFDF5) /* color-card */,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: const Color(0xFF7A5233) /* color-border */,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 236,
                          child: SizedBox(
                            width: 232,
                            child: Text(
                              '找出食材',
                              style: TextStyle(
                                color: const Color(0xFF4A3222) /* color-text */,
                                fontSize: game.isLargeFont ? 42 : 34,
                                fontFamily: 'Noto Serif TC',
                                fontWeight: FontWeight.w700,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 24,
                          top: 288,
                          child: SizedBox(
                            width: 232,
                            child: Text(
                              '點一下對的食材。',
                              style: TextStyle(
                                color: const Color(0xFF7A5233) /* color-border */,
                                fontSize: game.isLargeFont ? 24 : 22,
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