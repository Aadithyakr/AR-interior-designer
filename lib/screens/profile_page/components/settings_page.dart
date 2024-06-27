import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pro_s6/app_properties.dart';
import 'package:pro_s6/screens/auth/login_view.dart';
import 'package:pro_s6/screens/profile_page/components/change_language_page.dart';
import 'package:pro_s6/screens/profile_page/components/change_password_page.dart';
import 'package:pro_s6/screens/profile_page/components/legal_about_page.dart';
import 'package:pro_s6/screens/profile_page/components/notifications_settings_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: const Text('Settings', style: TextStyle(color: darkGrey)),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blueAccent, Colors.green]),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          blendMode: BlendMode.src,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'General',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SettingTile(
                      title: 'Language A / का',
                      icon: Icons.language,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ChangeLanguagePage(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SettingTile(
                      title: 'Notifications',
                      icon: Icons.notifications,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const NotificationSettingsPage(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SettingTile(
                      title: 'Legal & About',
                      icon: Icons.balance,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const LegalAboutPage(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SettingTile(
                      title: 'About Us',
                      icon: Icons.light,
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SettingTile(
                      title: 'Change Password',
                      icon: Icons.lock,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ChangePasswordPage(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SettingTile(
                      title: 'Sign out',
                      icon: Icons.logout_outlined,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const LoginView(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SettingTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.greenAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      iconColor: Colors.black87,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, color: Colors.black87),
      ),
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}