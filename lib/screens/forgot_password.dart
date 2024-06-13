import 'package:flutter/material.dart';
import 'package:pro_s6/screens/componenets/background_image.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _SignUpState();
}

class _SignUpState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const BackgroundImage(),
            Column(
              children: [
                const Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.mail_outline_rounded,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                ),
                Text(
                  'Verify Your Email Address\n',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "To continue using 'The Furniture App', please verify your email address: \n abc@xyc.com",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white70),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Continue to Login'),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Resend verification email?',
                          style: TextStyle(color: Colors.amberAccent),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
