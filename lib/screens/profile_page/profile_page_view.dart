import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_s6/helpers/loading/profile_menu.dart';
import 'package:pro_s6/helpers/loading/profile_pic.dart';
import 'package:pro_s6/screens/profile_page/components/legal_about_page.dart';
import 'package:pro_s6/screens/profile_page/components/settings_page.dart';
import 'package:pro_s6/services/auth/bloc/bloc.dart';
import 'package:pro_s6/services/auth/bloc/events.dart';

class ProfilePageView extends StatelessWidget {
  static String routeName = "/profile";

  const ProfilePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: Icons.person,
            press: () => {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: Icons.settings,
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SettingsPage(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Legal and about",
            icon: Icons.balance,
            press: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const LegalAboutPage(),
              ),
            ),
          ),
          ProfileMenu(
            text: "Log Out",
            icon: Icons.logout,
            press: () =>
                BlocProvider.of<AuthBloc>(context).add(const AuthEventLogOut()),
          ),
        ],
      ),
    );
  }
}
