import 'package:flutter/material.dart';

class OnLyricAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnLyricAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      title: const Text('On Lyric'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
