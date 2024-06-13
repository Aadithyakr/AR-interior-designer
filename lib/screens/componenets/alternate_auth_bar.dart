import 'package:flutter/widgets.dart';
import 'package:pro_s6/screens/sign_up.dart';

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
