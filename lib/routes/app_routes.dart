import 'package:flutter/material.dart';
import 'package:learn_flutter/screens/dismiss_item_screen.dart';
import 'package:learn_flutter/screens/drawer_screen.dart';
import 'package:learn_flutter/screens/parallax_scrolling_screen.dart';
import 'package:learn_flutter/screens/random_images_screen.dart';
import 'package:learn_flutter/screens/tab_bar_screen.dart';
import 'package:learn_flutter/screens/video_player_screen.dart';
import '../screens/home_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String randomImages = '/randomImages';
  static const String parallaxScrolling = '/parallaxScrolling';
  static const String dismissItem = '/dismissItem';
  static const String videoPlayer = '/videoPlayer';
  static const String tabBar = '/tabBar';
  static const String drawer = '/drawer';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomeScreen(),
      randomImages: (context) => const RandomImages(),
      parallaxScrolling: (context) => const ParallaxScrollingScreen(),
      dismissItem: (context) => const DismissItemScreen(),
      videoPlayer: (context) => const VideoPlayerScreen(),
      tabBar: (context) => const TabBarScreen(),
      drawer: (context) => const DrawerScreen(),
    };
  }

  Widget getRouteWidget(String route) {
    switch (route) {
      case AppRoutes.randomImages:
        return const RandomImages();
      case AppRoutes.parallaxScrolling:
        return const ParallaxScrollingScreen();
      case AppRoutes.dismissItem:
        return const DismissItemScreen();
      case AppRoutes.videoPlayer:
        return const VideoPlayerScreen();
      case AppRoutes.tabBar:
        return const TabBarScreen();
      case AppRoutes.drawer:
        return const DrawerScreen();
      default:
        return const HomeScreen();
    }
  }
}
