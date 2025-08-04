import 'package:bokly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class HorezontalCard extends StatelessWidget {
  const HorezontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3.4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsData.testImage),
          ),
          color: Colors.amber,
        ),
      ),
    );
  }
}
