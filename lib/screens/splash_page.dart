import 'package:pro_s6/app_properties.dart';

import 'package:flutter/material.dart';
import 'package:pro_s6/screens/welcome_back_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeBackPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [blue, mediumBlue, darkBlue])),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Opacity(
                    opacity: opacity.value,
                    child: Image.asset('assets/logo1.png')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: 'Powered by '),
                        TextSpan(
                            text: 'int2.io',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
