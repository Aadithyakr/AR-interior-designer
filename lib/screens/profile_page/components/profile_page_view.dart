import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:pro_s6/helpers/loading/profile_menu.dart';
import 'package:pro_s6/helpers/loading/profile_pic.dart';
import 'package:pro_s6/screens/profile_page/components/components/settings_page.dart';

class ProfilePageView extends StatelessWidget {
  static String routeName = "/profile";

  const ProfilePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Profile_background1.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: SingleChildScrollView(
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
                      text: "Notifications",
                      icon: Icons.notifications,
                      press: () {},
                    ),
                    ProfileMenu(
                      text: "Settings",
                      icon: Icons.settings,
                      press: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SettingsPage()));
                      },
                    ),
                    ProfileMenu(
                      text: "Help Center",
                      icon: Icons.help,
                      press: () {},
                    ),
                    ProfileMenu(
                      text: "Log Out",
                      icon: Icons.logout,
                      press: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
