import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_s6/app_properties.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  NotificationSettingsPageState createState() =>
      NotificationSettingsPageState();
}

class MyWidget extends StatefulWidget {
  const MyWidget(bool myOrders, {super.key});

  @override
  MyWidgetState createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      onChanged: (value) {
        setState(() {
          _switchValue = value;
        });
      },
      value: _switchValue,
      activeColor: Colors.blue, // assuming blue is a color
    );
  }
}

class NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool myOrders = true;
  bool reminders = true;
  bool newOffers = true;
  bool feedbackReviews = true;
  bool updates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Settings',
          style: TextStyle(color: darkGrey),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Notifications',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: const Text('My orders'),
                      trailing: MyWidget(myOrders),
                    ),
                    ListTile(
                      title: const Text('Reminders'),
                      trailing: MyWidget(reminders),
                    ),
                    ListTile(
                      title: const Text('New Offers'),
                      trailing: MyWidget(newOffers),
                    ),
                    ListTile(
                        title: const Text('Feedbacks and Reviews'),
                        trailing: MyWidget(
                          feedbackReviews,
                        )),
                    ListTile(
                      title: const Text('Updates'),
                      trailing: MyWidget(updates),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
