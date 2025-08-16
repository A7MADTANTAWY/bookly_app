import 'package:bokly_app/features/home/data/models/book_model/item.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/book_section_details_view.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/custom_details_list_view.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/custom_details_view_appBar.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookDetailsViewBody extends StatelessWidget {
  final Item item;
  const BookDetailsViewBody({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomDetailsViewAppbar(),

        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book Details Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: BookSectionDetailsView(item: item),
              ),

              Expanded(child: const SizedBox(height: 10)),

              // "You Can Also See" Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  children: [
                    Text(
                      "You Can Also See",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5),

              // Horizontal List
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
                child: Skeletonizer(
                  enabled: false,
                  child: CustomDetailsListView(widthOfSizedBbox: 20),
                ),
              ),

              const SizedBox(height: 13),
            ],
          ),
        ),
      ],
    );
  }
}
