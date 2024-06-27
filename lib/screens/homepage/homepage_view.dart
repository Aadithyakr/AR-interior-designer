import 'package:flutter/material.dart';
import 'package:pro_s6/screens/homepage/components/categories.dart';
import 'package:pro_s6/screens/homepage/components/home_header.dart';
import 'package:pro_s6/screens/homepage/components/popular_product.dart';
import 'package:pro_s6/screens/homepage/components/category_swipe_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Fav",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trolley),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2),
              label: "Profile",
            ),
          ],
        ),
        body: const SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                HomeHeader(),
                Categories(),
                CategorySwipeCards(),
                SizedBox(height: 20),
                PopularProducts(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
