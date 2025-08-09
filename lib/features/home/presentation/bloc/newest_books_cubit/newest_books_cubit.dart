import 'package:bloc/bloc.dart';
import 'package:bokly_app/features/home/data/models/book_model/item.dart';
import 'package:bokly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(NewestBooksLoading());
    final result = await homeRepo.fetchBestNewestBooks();
    result.fold(
      (failure) => emit(NewestBooksFailure(errorMessage: failure.errorMessage)),
      (books) => emit(NewestBooksSuccess(books: books)),
    );
  }
}
