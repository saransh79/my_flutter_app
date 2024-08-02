import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.motorcycle)),
              ],
            ),
          ),
          body: TabBarView(
            children: tabImages
                .map((img) => FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage, image: img,
            fit: BoxFit.fill,))
                .toList(),
          ),
        ),
      ),
    );
  }
}

const List<String> tabImages = [
  "https://img.freepik.com/premium-photo/super-car-wallpaper-mobile-screen_911078-2743.jpg",
  "https://wallpaper.forfun.com/fetch/5f/5f2c39b7d1a7cc8f7d452abaeec0717a.jpeg",
  "https://w0.peakpx.com/wallpaper/346/911/HD-wallpaper-bike-bike-super.jpg"
];
