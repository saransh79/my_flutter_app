import 'package:flutter/material.dart';
import 'package:learn_flutter/view/screens/dismiss_item_screen.dart';
import 'package:learn_flutter/view/screens/drawer_screen.dart';
import 'package:learn_flutter/view/screens/jokes_screen.dart';
import 'package:learn_flutter/view/screens/parallax_scrolling_screen.dart';
import 'package:learn_flutter/view/screens/provider_screen.dart';
import 'package:learn_flutter/view/screens/random_images_screen.dart';
import 'package:learn_flutter/view/screens/tab_bar_screen.dart';
import 'package:learn_flutter/view/screens/video_player_screen.dart';
import 'package:learn_flutter/view/screens/weather_screen.dart';
import '../screens/home_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String randomImages = '/randomImages';
  static const String parallaxScrolling = '/parallaxScrolling';
  static const String dismissItem = '/dismissItem';
  static const String videoPlayer = '/videoPlayer';
  static const String tabBar = '/tabBar';
  static const String drawer = '/drawer';
  static const String provider = '/provider';
  static const String weather = '/weather';
  static const String jokes = '/jokes';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomeScreen(),
      randomImages: (context) => const RandomImages(),
      parallaxScrolling: (context) => const ParallaxScrollingScreen(),
      dismissItem: (context) => const DismissItemScreen(),
      videoPlayer: (context) => const VideoPlayerScreen(),
      tabBar: (context) => const TabBarScreen(),
      drawer: (context) => const DrawerScreen(),
      provider: (context) => const ProviderMainScreen(),
      weather: (context) => const WeatherScreen(),
      jokes: (context) => const JokesScreen(),
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
      case AppRoutes.provider:
        return const ProviderMainScreen();
      case AppRoutes.weather:
        return const WeatherScreen();
      case AppRoutes.jokes:
        return const JokesScreen();
      default:
        return const HomeScreen();
    }
  }
}
