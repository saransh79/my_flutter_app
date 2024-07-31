import 'package:flutter/material.dart';
import 'package:learn_flutter/constants/color_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = darkBlue,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4,
          color: Colors.white
        ),
      ),
      automaticallyImplyLeading: true,
      foregroundColor: Colors.white,
      centerTitle: true,
      backgroundColor: backgroundColor,
    );
  }
}
