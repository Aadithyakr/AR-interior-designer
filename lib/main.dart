import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_s6/screens/homepage/homepage_view.dart';
import 'package:pro_s6/screens/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:pro_s6/screens/auth/verify_email.dart';
import 'package:pro_s6/screens/auth/login_view.dart';
import 'package:pro_s6/services/auth/bloc/bloc.dart';
import 'package:pro_s6/services/auth/bloc/events.dart';
import 'package:pro_s6/services/auth/bloc/states.dart';
import 'package:pro_s6/services/auth/service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eCommerce int2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      home: BlocProvider(
        create: (context) => AuthBloc(AuthService.firebase()),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is AuthStateLoggedIn) {
              return HomeScreen(
                userId: AuthService.firebase().currentUser!.id,
              );
            } else if (state is AuthStateLoggedOut) {
              return const LoginView();
            } else if (state is AuthStateNeedsVerification) {
              return const VerifyEmailView();
            } else if (state is AuthStateRegistering) {
              return const SignUpView();
            } else {
              context.read<AuthBloc>().add(const AuthEventInitialize());
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
