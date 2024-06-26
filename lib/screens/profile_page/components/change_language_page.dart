import 'package:flutter/material.dart';
import 'package:pro_s6/app_properties.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({super.key});

  @override
  ChangeCountryPageState createState() => ChangeCountryPageState();
}

class ChangeCountryPageState extends State<ChangeLanguagePage> {
  List<String> languages = [
    'Chinesse',
    'Spanish',
    'English',
    'Romanian',
    'German',
    'Portuguese',
    'Bengali',
    'Russian',
    'Japanese',
    'French',
  ];

  String currentLanguage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
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
                  'Language A / का',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Flexible(
                child: ListView(
                  children: languages
                      .map(
                        (l) => ListTile(
                          onTap: () {
                            setState(() {
                              currentLanguage = l;
                            });
                          },
                          title: Text(
                            l,
                            style: const TextStyle(fontSize: 14),
                          ),
                          trailing: l == currentLanguage
                              ? const Icon(
                                  Icons.check_circle,
                                  color: blue,
                                  size: 16,
                                )
                              : const SizedBox(),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
