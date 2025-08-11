import 'package:bokly_app/core/utils/assets.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/action_button_details_view.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/horizontal_card_success.dart';
import 'package:flutter/material.dart';

class BookSectionDetailsView extends StatelessWidget {
  const BookSectionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.32,
          child: HorizontalCardSuccess(imageUrl: ''),
        ),
        const SizedBox(height: 10),
        const Text(
          "Harry Potter",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            fontFamily: AssetsData.gtFont,
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 5),
        const Text(
          "A young boy",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 5),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 18),
            SizedBox(width: 3),
            Text(
              "4.5",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 5),
            Text(
              "(1523)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        ActionButtonDetailsView(),
      ],
    );
  }
}
