import 'package:flutter/material.dart';
import 'package:pro_s6/rive_models/menu.dart';
import 'package:rive/rive.dart';

class BtmNavItem extends StatelessWidget {
  const BtmNavItem({
    super.key,
    required this.navBar,
    required this.press,
    required this.riveOnInit,
    required this.selectedNav,
  });

  final Menu navBar;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final Menu selectedNav;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBar(isActive: selectedNav == navBar),
          SizedBox(
            height: 36,
            width: 36,
            child: Opacity(
              opacity: selectedNav == navBar ? 1 : 0.5,
              child: RiveAnimation.asset(
                navBar.rive.src,
                artboard: navBar.rive.artboard,
                onInit: riveOnInit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 2),
      duration: const Duration(milliseconds: 200),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: const BoxDecoration(
        color: Color(0xFF81B4FF),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
