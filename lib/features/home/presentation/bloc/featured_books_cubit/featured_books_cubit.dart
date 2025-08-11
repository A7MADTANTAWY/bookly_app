import 'package:bloc/bloc.dart';
import 'package:bokly_app/features/home/data/models/book_model/item.dart';
import 'package:bokly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    final result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) =>
          emit(FeaturedBooksFailure(errorMessage: failure.errorMessage)),
      (books) => emit(FeaturedBooksSuccess(books: books)),
    );
  }
}
