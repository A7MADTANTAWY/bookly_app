import 'package:bokly_app/constants.dart';
import 'package:bokly_app/core/utils/services_locator.dart';
import 'package:bokly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bokly_app/features/home/presentation/bloc/featured_books_cubit/featured_books_cubit.dart';
import 'package:bokly_app/features/home/presentation/bloc/newest_books_cubit/newest_books_cubit.dart';
import 'package:bokly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImplementation>()),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImplementation>()),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratAlternatesTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        home: const SplashView(),
      ),
    );
  }
}
