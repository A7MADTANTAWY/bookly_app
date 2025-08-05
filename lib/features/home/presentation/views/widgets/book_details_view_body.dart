import 'package:bokly_app/features/home/presentation/views/widgets/book_section_details_view.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/custom_details_view_appBar.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/custom_hor_list_view.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomDetailsViewAppbar(),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: BookSectionDetailsView(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Row(
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
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.23,
            child: Skeletonizer(
              enabled: false,
              child: CustomHorListView(widthOfSizedBbox: 20),
            ),
          ),
        ),
      ],
    );
  }
}
