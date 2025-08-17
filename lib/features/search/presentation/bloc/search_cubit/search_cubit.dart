import 'package:bloc/bloc.dart';
import 'package:bokly_app/features/home/data/models/book_model/item.dart';
import 'package:bokly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> searchBook({required String category}) async {
    emit(SearchLoading());

    final result = await searchRepo.searchBooks(category: category);

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(SearchFailure(errorMessage: failure.errorMessage));
        }
      },
      (books) {
        if (!isClosed) {
          emit(SearchSuccess(books: books));
        }
      },
    );
  }
}
