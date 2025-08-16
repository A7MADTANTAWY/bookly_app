import 'package:bokly_app/features/home/data/models/book_model/item.dart';
import 'package:bokly_app/features/home/presentation/views/book_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HorizontalCardSuccess extends StatelessWidget {
  final Item item;

  final String comeFrom;

  const HorizontalCardSuccess({
    super.key,
    required this.item,
    required this.comeFrom,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        comeFrom == "home view"
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsView(item: item),
                ),
              )
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsView(item: item),
                ),
              );

        // Handle tap action, e.g., navigate to book details
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12), // هنا كانت غلط Geometry
        child: AspectRatio(
          aspectRatio: 2 / 3.25,
          child: CachedNetworkImage(
            imageUrl: item.volumeInfo.imageLinks?.thumbnail ?? "",
            fit: BoxFit.fill,
            placeholder: (context, url) =>
                Container(color: Colors.white.withOpacity(0.1)),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
