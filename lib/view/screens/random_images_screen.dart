import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/appbar.dart';
import 'package:transparent_image/transparent_image.dart';

class RandomImages extends StatelessWidget {
  const RandomImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Random Images',
      ),
      body: _buildGrid(),
    );
  }

  /// widget to build grid for images
  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(5),
      // scrollDirection: Axis.horizontal,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: _buildGridTileList(_imagesList));

  /// function to generate list of images
  List<Container> _buildGridTileList(List<String> imagesList) => List.generate(
      imagesList.length,
          (i) => Container(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image:
            imagesList[i],
            fit: BoxFit.fill,
          )));
}

List<String> _imagesList = [
  "https://picsum.photos/id/1011/200/300",
  "https://picsum.photos/id/1025/200/300",
  "https://picsum.photos/id/1047/200/300",
  "https://picsum.photos/id/1060/200/300",
  "https://picsum.photos/id/1074/200/300",
  "https://picsum.photos/id/1080/200/300",
  "https://picsum.photos/id/109/200/300",
  "https://picsum.photos/id/110/200/300",
  "https://picsum.photos/id/112/200/300",
  "https://picsum.photos/id/115/200/300",
  "https://picsum.photos/id/116/200/300",
  "https://picsum.photos/id/118/200/300",
  "https://picsum.photos/id/120/200/300",
  "https://picsum.photos/id/121/200/300",
  "https://picsum.photos/id/122/200/300",
  "https://picsum.photos/id/124/200/300",
  "https://picsum.photos/id/128/200/300",
  "https://picsum.photos/id/129/200/300",
  "https://picsum.photos/id/130/200/300",
  "https://picsum.photos/id/133/200/300",
  "https://picsum.photos/id/137/200/300",
  "https://picsum.photos/id/140/200/300",
  "https://picsum.photos/id/145/200/300",
  "https://picsum.photos/id/146/200/300",
  "https://picsum.photos/id/149/200/300",
  "https://picsum.photos/id/152/200/300",
  "https://picsum.photos/id/155/200/300",
  "https://picsum.photos/id/160/200/300",
  "https://picsum.photos/id/163/200/300",
  "https://picsum.photos/id/164/200/300",
];