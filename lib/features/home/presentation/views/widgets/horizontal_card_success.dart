import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HorizontalCardSuccess extends StatelessWidget {
  final String imageUrl;

  const HorizontalCardSuccess({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12), // هنا كانت غلط Geometry
      child: AspectRatio(
        aspectRatio: 2 / 3.25,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          placeholder: (context, url) => Container(
            color: Colors.white.withOpacity(0.1),
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
          ),
          errorWidget: (context, url, error) =>
              const Icon(Icons.error, color: Colors.red),
        ),
      ),
    );
  }
}
