import 'package:bokly_app/core/utils/services_locator.dart';
import 'package:bokly_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:bokly_app/features/search/presentation/bloc/search_cubit/search_cubit.dart';
import 'package:bokly_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImplementation>()),
      child: Scaffold(body: SearchViewBody()),
    );
  }
}
