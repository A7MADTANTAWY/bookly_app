import 'package:bokly_app/core/utils/assets.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/vertical_cards_loading.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/vertical_cards_success.dart';
import 'package:bokly_app/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:bokly_app/features/search/presentation/views/widgets/custom_appBarr_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return CustomScrollView(
            slivers: [
              const CustomAppbarrSearchView(),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 13, top: 10, bottom: 5),
                  child: Text(
                    "Search Results",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const Skeletonizer(
                    enabled: true,
                    child: VerticalCardLoading(),
                  ),
                  childCount: 10,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
            ],
          );
        } else if (state is SearchFailure) {
          return CustomScrollView(
            slivers: [
              const CustomAppbarrSearchView(),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 13, top: 10, bottom: 5),
                  child: Text(
                    "Search Results",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          );
        } else if (state is SearchSuccess) {
          return CustomScrollView(
            slivers: [
              const CustomAppbarrSearchView(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 13, top: 10, bottom: 5),
                  child: Text(
                    state.books.isEmpty ? "" : "Search Results",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              state.books.isEmpty
                  ? SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(height: 70),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(AssetsData.searchImage),
                          ),
                          Center(
                            child: Text(
                              "Oops! No results found 😞",
                              style: TextStyle(fontSize: 23),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            VerticalCardsSuccess(item: state.books[index]),
                        childCount: state.books.length,
                      ),
                    ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
            ],
          );
        } else {
          return CustomScrollView(
            slivers: [
              const CustomAppbarrSearchView(),
              SliverToBoxAdapter(child: SizedBox(height: 80)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AssetsData.searchImage),
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "Search For Your Book",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
