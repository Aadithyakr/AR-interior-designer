import 'dart:ui';
import 'package:flutter/material.dart'; // Add this import
import 'package:pro_s6/app_properties.dart';
import 'package:pro_s6/rive_models/menu.dart';
import 'package:pro_s6/rive_models/rive_utils.dart';
import 'package:pro_s6/screens/btm_nav_bar.dart';
import 'package:pro_s6/screens/favourite_view.dart';
import 'package:pro_s6/screens/homepage/components/popular_product.dart';
import 'package:pro_s6/screens/homepage/components/category_swipe_cards.dart';
import 'package:pro_s6/screens/notification_view.dart';
import 'package:pro_s6/screens/profile_page/profile_page_view.dart';
import 'package:pro_s6/screens/search_view.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Menu selectedBottonNav = bottomNavItems.first;
  late AssetImage myAsset;
  late Animation<double> animation;
  late PageController pageController;
  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {});
  }

  void updateSelectedBtmNav(Menu menu) {
    if (selectedBottonNav != menu) {
      setState(() {
        selectedBottonNav = menu;
      });
    }
  }

  late AnimationController _animationController;
  late Animation<double> scalAnimation;

  @override
  void initState() {
    super.initState();
    myAsset = const AssetImage('assets/Design1loop.gif');
    pageController = PageController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(
        () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    pageController.dispose();
    myAsset.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Transform.translate(
          offset: Offset(0, 100 * animation.value),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                left: 12,
                top: 12,
                right: 12,
                bottom: 12,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              decoration: BoxDecoration(
                color: backgroundColor2.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor2.withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  bottomNavItems.length,
                  (index) {
                    Menu navBar = bottomNavItems[index];
                    return BtmNavItem(
                      navBar: navBar,
                      press: () {
                        RiveUtils.chnageSMIBoolState(navBar.rive.status!);
                        updateSelectedBtmNav(navBar);
                        navigationTapped(index);
                        print('$index suvgwgwi');
                      },
                      riveOnInit: (artboard) {
                        navBar.rive.status = RiveUtils.getRiveInput(
                          artboard,
                          stateMachineName: navBar.rive.stateMachineName,
                        );
                      },
                      selectedNav: selectedBottonNav,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: const SizedBox(),
                ),
              ),
              const RiveAnimation.asset(
                "assets/RiveAssets/shapes.riv",
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: const SizedBox(),
                ),
              ),
              PageView(
                controller: pageController,
                onPageChanged: onPageChanged,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Image(image: myAsset),
                        // Image.asset(
                        //   'assets/Design1loop.gif',
                        //   fit: BoxFit.fill,
                        // ),
                        const CategorySwipeCards(),
                        const SizedBox(height: 20),
                        const PopularProducts(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SearchView(),
                  const CartScreen(),
                  const NotificationView(),
                  const ProfilePageView(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
