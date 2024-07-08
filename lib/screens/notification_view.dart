import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.notifications_active_outlined,
          size: 60,
        ),
        Text(
          'You can view your notifications here',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
