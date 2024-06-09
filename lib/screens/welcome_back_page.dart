import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeBackPage extends StatefulWidget {
  const WelcomeBackPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false, // Add this
      body: Stack(
        children: <Widget>[
          BackgroundImage(),
          LoginForm(),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/welcome.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 150,
          ),
          WelcomeBackTitle(),
          SizedBox(
            height: 90,
          ),
          SubTitle(),
          SizedBox(
            height: 20,
          ),
          LoginFields(),
          SizedBox(
            height: 200,
          ),
          SignUp(),
          SizedBox(
            height: 20,
          ),
          ForgotPassword(),
        ],
      ),
    );
  }
}

class WelcomeBackTitle extends StatelessWidget {
  const WelcomeBackTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome Back ,',
      style: TextStyle(
        color: Colors.white,
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
        shadows: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            offset: Offset(0, 5),
            blurRadius: 10.0,
          )
        ],
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 56.0),
      child: Text(
        'Login to your account',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Form(
        child: Column(
          children: <Widget>[
            GlassmorphicContainer(
              width: 350,
              height: 60,
              borderRadius: 20,
              blur: 20,
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.5),
                  Color((0xFFFFFFFF)).withOpacity(0.5),
                ],
              ),
              child: TextFormField(
                style: const TextStyle(fontSize: 16.0, color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.blueAccent,
                  ),
                  labelText: 'Email',
                  labelStyle: GoogleFonts.pacifico(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GlassmorphicContainer(
              width: 350,
              height: 60,
              borderRadius: 20,
              blur: 20,
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.1),
                    const Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: const [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0.5),
                  const Color((0xFFFFFFFF)).withOpacity(0.5),
                ],
              ),
              child: TextFormField(
                style: const TextStyle(fontSize: 16.0, color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.blueAccent,
                  ),
                  labelText: 'Password',
                  labelStyle: GoogleFonts.pacifico(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SplashScreen(),;
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Log In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Forgot your password? ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Text(
              'Reset password',
              style: TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'New here?  ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
          InkWell(
            // onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Sign_in(),));},
            child: const Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
