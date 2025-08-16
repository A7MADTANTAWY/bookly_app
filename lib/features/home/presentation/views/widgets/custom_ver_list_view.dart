import 'package:bokly_app/features/home/presentation/bloc/newest_books_cubit/newest_books_cubit.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/vertical_cards_loading.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/vertical_cards_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomVerListView extends StatelessWidget {
  const CustomVerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  VerticalCardsSuccess(item: state.books[index]),
              childCount: state.books.length,
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  Skeletonizer(enabled: true, child: VerticalCardLoading()),
              childCount: 10,
            ),
          );
        }
      },
    );
  }
}
