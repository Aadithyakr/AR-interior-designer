import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_s6/screens/componenets/background_image.dart';
import 'package:pro_s6/screens/welcome_back_page.dart';
import 'package:pro_s6/services/auth/bloc/bloc.dart';
import 'package:pro_s6/services/auth/bloc/events.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _SignUpState();
}

class _SignUpState extends State<VerifyEmailView> {
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
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WelcomeBackPage(),
                      ),
                    );
                  },
                  child: const Text('Continue to Login'),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () => context
                          .watch<AuthBloc>()
                          .add(const AuthEventSendEmailVerification()),
                      child: const Text(
                        'Resend verification email?',
                        style: TextStyle(color: Colors.amberAccent),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
