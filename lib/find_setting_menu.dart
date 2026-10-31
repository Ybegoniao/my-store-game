import 'package:flutter/material.dart';
import 'main_game.dart';
import 'dart:async';
import 'dart:math';

class FindSettingMenu extends StatefulWidget {
  final MyStoreGame game;
  const FindSettingMenu({super.key, required this.game});

  @override
  State<FindSettingMenu> createState() => _FindSettingMenuState();
}

class _FindSettingMenuState extends State<FindSettingMenu> {

  int grandmaExpression = 0;

  Timer? _grandmaTimer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    
    void scheduleGrandmaNext() {
      if (grandmaExpression == 0) {
        int longWait = 10 + _random.nextInt(8); 
        _grandmaTimer = Timer(Duration(seconds: longWait), () {
          if (!mounted) return;
          setState(() {
            grandmaExpression = _random.nextBool() ? 1 : 3; 
          });
          scheduleGrandmaNext();
        });
      } else {
        int shortWait = 2 + _random.nextInt(2); 
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
  
  Widget _buildSettingButton({
    required double left,
    required double top,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final bgColor = isSelected ? const Color(0xFFB84E14) : const Color(0xFFFFFDF5);
    final borderColor = isSelected ? const Color(0xFFB84E14) : const Color(0xFF7A5233);
    final textColor = isSelected ? const Color(0xFFFFFDF5) : const Color(0xFF4A3222);
    final shadows = isSelected ? const [BoxShadow(color: Color(0xFF7A5233), offset: Offset(0, 5))] : null;

    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 150,
          height: 76,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 150,
                  height: 76,
                  decoration: ShapeDecoration(
                    color: bgColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: borderColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadows: shadows,
                  ),
                ),
              ),
              // 文字置中
              Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: widget.game.isLargeFont ? 38 : 30,
                    fontFamily: 'Noto Sans TC',
                    fontWeight: FontWeight.w700,
                    height: 1.20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
          decoration: const BoxDecoration(),
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
                      Positioned(left: 0, top: 0, child: Container(width: 1000, height: 625, decoration: const BoxDecoration(color: Color(0xFFEBDAB6)))),
                      Positioned(left: 0, top: 0, child: Container(width: 1000, height: 625, decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/images/background_0.png"), fit: BoxFit.cover)))),
                      Positioned(left: 0, top: 0, child: Opacity(opacity: 0.55, child: Container(width: 1000, height: 625, decoration: const BoxDecoration(color: Color(0xFFFFFDF5))))),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30, top: 367.35,
                child: Container(width: 202.40, height: 242.65, child: Image.asset('lib/assets/images/grandma_$grandmaExpression.png', fit: BoxFit.contain)),
              ),
              Positioned(
                left: 270, top: 50,
                child: Container(
                  width: 680, height: 525,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0, top: 0,
                        child: Container(
                          width: 680, height: 525,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFFFDF5),
                            shape: RoundedRectangleBorder(side: const BorderSide(width: 3, color: Color(0xFF7A5233)), borderRadius: BorderRadius.circular(28)),
                            shadows: const [BoxShadow(color: Color(0x2D4A3222), blurRadius: 18, offset: Offset(0, 6))],
                          ),
                        ),
                      ),
                      Positioned(left: 48, top: 36, child: Text('設定', style: TextStyle(color: Color(0xFF4A3222), fontSize: widget.game.isLargeFont ? 50 : 44, fontFamily: 'Noto Serif TC', fontWeight: FontWeight.w700))),
                      Positioned(left: 48, top: 148, child: Text('字的大小', style: TextStyle(color: Color(0xFF4A3222), fontSize: widget.game.isLargeFont ? 38 : 30, fontFamily: 'Noto Sans TC', fontWeight: FontWeight.w500))),
                      Positioned(left: 48, top: 222, child: Container(width: 584, height: 2, decoration: const BoxDecoration(color: Color(0xFFD9BF8F)))),
                      Positioned(left: 48, top: 252, child: Text('聲音', style: TextStyle(color: Color(0xFF4A3222), fontSize: widget.game.isLargeFont ? 38 : 30, fontFamily: 'Noto Sans TC', fontWeight: FontWeight.w500))),
                      Positioned(left: 48, top: 326, child: Container(width: 584, height: 2, decoration: const BoxDecoration(color: Color(0xFFD9BF8F)))),
                      Positioned(left: 48, top: 356, child: Text('幫我唸出題目', style: TextStyle(color: Color(0xFF4A3222), fontSize: widget.game.isLargeFont ? 38 : 30, fontFamily: 'Noto Sans TC', fontWeight: FontWeight.w500))),
                      
                      
                      // 字的大小：大
                      _buildSettingButton(
                        left: 330, top: 130, text: '大',
                        isSelected: !widget.game.isLargeFont,
                        onTap: () => setState(() => widget.game.isLargeFont = false),
                      ),
                      // 字的大小：特大
                      _buildSettingButton(
                        left: 496, top: 130, text: '特大',
                        isSelected: widget.game.isLargeFont,
                        onTap: () => setState(() => widget.game.isLargeFont = true),
                      ),

                      // 聲音：開
                      _buildSettingButton(
                        left: 330, top: 234, text: '開',
                        isSelected: widget.game.isSoundOn,
                        onTap: () => setState(() => widget.game.isSoundOn = true),
                      ),
                      // 聲音：關
                      _buildSettingButton(
                        left: 496, top: 234, text: '關',
                        isSelected: !widget.game.isSoundOn,
                        onTap: () => setState(() => widget.game.isSoundOn = false),
                      ),

                      // 唸題目：開
                      _buildSettingButton(
                        left: 330, top: 338, text: '開',
                        isSelected: widget.game.isReadAloudOn,
                        onTap: () => setState(() => widget.game.isReadAloudOn = true),
                      ),
                      // 唸題目：關
                      _buildSettingButton(
                        left: 496, top: 338, text: '關',
                        isSelected: !widget.game.isReadAloudOn,
                        onTap: () => setState(() => widget.game.isReadAloudOn = false),
                      ),

                      Positioned(
                        left: 48,
                        top: 430,
                        child: GestureDetector(
                          onTap: () {
                            widget.game.overlays.remove('FindSettingMenu');
                            dispose();
                          },
                          child: Container(
                            width: 584,
                            height: 76,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0, top: 0,
                                  child: Container(
                                    width: 584, height: 76,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFB84E14),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      shadows: const [BoxShadow(color: Color(0xFF7A5233), offset: Offset(0, 5))],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '好了',
                                    style: TextStyle(color: Color(0xFFFFFDF5), fontSize: widget.game.isLargeFont ? 38 : 30, fontFamily: 'Noto Sans TC', fontWeight: FontWeight.w700),
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