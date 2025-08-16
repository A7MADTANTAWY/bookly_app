import 'package:bokly_app/core/utils/assets.dart';
import 'package:bokly_app/features/home/data/models/book_model/item.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/action_button_details_view.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/horizontal_card_success.dart';
import 'package:flutter/material.dart';

class BookSectionDetailsView extends StatelessWidget {
  final Item item;

  const BookSectionDetailsView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.32,
          child: HorizontalCardSuccess(item: item, comeFrom: 'details view'),
        ),
        const SizedBox(height: 10),
        Text(
          item.volumeInfo.title!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            fontFamily: AssetsData.gtFont,
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 5),
        Text(
          item.volumeInfo.authors?[0] ?? "Uknown",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 18),
            SizedBox(width: 3),
            Text(
              "4.9",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 5),
            Text(
              "(${item.volumeInfo.pageCount})",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ActionButtonDetailsView(item: item),
      ],
    );
  }
}
