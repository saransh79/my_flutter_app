import 'package:flutter/material.dart';
import 'package:learn_flutter/view/animations/custom_animations.dart';
import 'package:learn_flutter/widgets/appbar.dart';

import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  final void Function(Locale locale)? onLanguageChange;

  const HomeScreen({super.key, this.onLanguageChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Home',
      ),
      body: _buildList(context),
    );
  }

  // Widget _buildLanguageDropdown(BuildContext context) {
  //   return DropdownButton<Locale>(
  //     value: const Locale('en'),
  //     icon: const Icon(Icons.language),
  //     onChanged: (Locale? newValue) {
  //       onLanguageChange!(newValue!);
  //     },
  //     items: const [
  //       DropdownMenuItem(
  //         value: Locale('en'),
  //         child: Text('English'),
  //       ),
  //       DropdownMenuItem(
  //         value: Locale('es'),
  //         child: Text('Español'),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: _tileData
          .map((tileItem) => _tile(context, tileItem['title'],
              tileItem['subtitle'], tileItem['icon'], tileItem['route']))
          .toList(),
    );
  }

  InkWell _tile(BuildContext context, String title, String subtitle,
      IconData icon, String route) {
    return InkWell(
      onTap: () {
        Navigator.push(context, _createRoute(route));
      },
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
        ),
      ),
    );
  }
}

Route _createRoute(String route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return AppRoutes().getRouteWidget(route);
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final randomAnimation = _getRandomAnimation(animation, child);
      return randomAnimation;
    },
  );
}

Widget _getRandomAnimation(Animation<double> animation, Widget child) {
  final animations = [
    CustomAnimations().slideTransition(animation, child),
    CustomAnimations().fadeTransition(animation, child),
    CustomAnimations().scaleTransition(animation, child),
    CustomAnimations().rotationTransition(animation, child),
  ];

  // animations.shuffle();
  return animations[1];
}

final List<Map<String, dynamic>> _tileData = [
  {
    'title': 'View Random Images',
    'subtitle': 'View 30 random images',
    'icon': Icons.image,
    'route': AppRoutes.randomImages
  },
  {
    'title': 'Parallax Scrolling',
    'subtitle': 'View Scrolling effects',
    'icon': Icons.swipe,
    'route': AppRoutes.parallaxScrolling
  },
  {
    'title': 'Dismiss items',
    'subtitle': 'View dismiss effect',
    'icon': Icons.delete,
    'route': AppRoutes.dismissItem
  },
  {
    'title': 'Video Player',
    'subtitle': 'View video',
    'icon': Icons.video_file,
    'route': AppRoutes.videoPlayer
  },
  {
    'title': 'TabBar Screen',
    'subtitle': 'Handling TabBar',
    'icon': Icons.tab,
    'route': AppRoutes.tabBar
  },
  {
    'title': 'Drawer Screen',
    'subtitle': 'Handling Drawer',
    'icon': Icons.drag_handle,
    'route': AppRoutes.drawer
  },
  {
    'title': 'Learn Provider',
    'subtitle': 'Learning provider basics',
    'icon': Icons.read_more_outlined,
    'route': AppRoutes.provider
  },
  {
    'title': 'Weather',
    'subtitle': 'Check weather',
    'icon': Icons.sunny,
    'route': AppRoutes.weather
  }
];
