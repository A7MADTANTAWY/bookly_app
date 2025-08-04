import 'package:bokly_app/constants.dart';
import 'package:bokly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kPrimaryColor,
      scrolledUnderElevation: 0,
      title: Image.asset(AssetsData.logo, height: 25),
      pinned: true,
      floating: false,
      snap: false,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(icon: const Icon(Icons.search, size: 35), onPressed: () {}),
      ],
    );
  }
}
