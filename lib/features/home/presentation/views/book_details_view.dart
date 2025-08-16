import 'package:bokly_app/core/utils/services_locator.dart';
import 'package:bokly_app/features/home/data/models/book_model/item.dart';
import 'package:bokly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bokly_app/features/home/presentation/bloc/similar_books_cubit/similar_books_cubit.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  final Item item;

  const BookDetailsView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SimilarBooksCubit(getIt.get<HomeRepoImplementation>())
            ..fetchSimilarBooks(category: item.volumeInfo.categories![0]),
      child: Scaffold(body: BookDetailsViewBody(item: item)),
    );
  }
}
