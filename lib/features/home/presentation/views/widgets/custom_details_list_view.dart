import 'package:bokly_app/features/home/presentation/bloc/similar_books_cubit/similar_books_cubit.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/horizontal_card_success.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/horizontal_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomDetailsListView extends StatelessWidget {
  const CustomDetailsListView({super.key, required this.widthOfSizedBbox});

  final double widthOfSizedBbox;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
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
                  item: state.books[index - 1],
                  comeFrom: 'details view',
                ),
              );
            },
          );
        } else if (state is SimilarBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 11, // 10 cards + 1 spacer
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox(width: widthOfSizedBbox);
              }
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Skeletonizer(
                  enabled: true,
                  child: HorizontalCardLoading(),
                ),
              );
            },
          );
        }
      },
    );
  }
}
