import 'package:rive/rive.dart';

class RiveModel {
  final String src, artboard, stateMachineName;
  late SMIBool? status;

  RiveModel({
    required this.src,
    required this.artboard,
    required this.stateMachineName,
    this.status,
  });

  set setStatus(SMIBool state) {
    status = state;
  }
}

class Menu {
  final String title;
  final RiveModel rive;

  Menu({required this.title, required this.rive});
}

List<Menu> bottomNavItems = [
  Menu(
    title: "Home",
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
    ),
  ),
  Menu(
    title: "Search",
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
    ),
  ),
  Menu(
    title: "Favorites",
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "LIKE/STAR",
      stateMachineName: "STAR_Interactivity",
    ),
  ),
  Menu(
    title: "Notification",
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
    ),
  ),
  Menu(
    title: "Profile",
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
    ),
  ),
];
