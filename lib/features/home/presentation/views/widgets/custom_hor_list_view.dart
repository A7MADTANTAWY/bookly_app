import 'package:bokly_app/features/home/presentation/bloc/featured_books_cubit/featured_books_cubit.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/horizontal_card_success.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/horizontal_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomHorListView extends StatelessWidget {
  const CustomHorListView({super.key, required this.widthOfSizedBbox});

  final double widthOfSizedBbox;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        print(state);

        if (state is FeaturedBooksSuccess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.books.length + 1, // 10 cards + 1 spacer
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox(width: widthOfSizedBbox);
              }
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: HorizontalCardSuccess(
                  imageUrl:
                      state.books[index - 1].volumeInfo.imageLinks.thumbnail,
                ),
              );
            },
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Skeletonizer(
            enabled: true,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 11, // 10 cards + 1 spacer
              itemBuilder: (context, index) {
                if (index == 0) {
                  return SizedBox(width: widthOfSizedBbox);
                }
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: HorizontalCardLoading(),
                );
              },
            ),
          );
        }
      },
    );
  }
}
