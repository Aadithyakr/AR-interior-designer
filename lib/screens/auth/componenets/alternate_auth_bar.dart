import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class AlternateAuth extends StatelessWidget {
  const AlternateAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SocialCard(
            icon: "assets/icons/google-icon.svg",
            press: () {},
          ),
          SocialCard(
            icon: "assets/icons/facebook.svg",
            press: () {},
          ),
          SocialCard(
            icon: "assets/icons/twitter.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key,
    this.icon,
    this.press,
  });

  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(12),
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon!),
      ),
    );
  }
}
