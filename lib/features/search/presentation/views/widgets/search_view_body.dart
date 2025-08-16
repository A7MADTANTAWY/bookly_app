import 'package:bokly_app/features/home/presentation/views/widgets/vertical_cards_loading.dart';
import 'package:bokly_app/features/search/presentation/views/widgets/custom_appBarr_search_view.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppbarrSearchView(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 13, top: 10, bottom: 5),
            child: Text(
              "Search Results",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) =>
                Skeletonizer(enabled: false, child: VerticalCardLoading()),
            childCount: 10,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
      ],
    );
  }
}
