import 'package:bokly_app/core/errors/failure.dart';
import 'package:bokly_app/core/utils/api_service.dart';
import 'package:bokly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bokly_app/features/home/data/models/book_model/item.dart';
import 'package:bokly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation extends SearchRepo {
  ApiService apiService;

  SearchRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<Item>>> searchBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Sorting=relevance&Filtering=free-ebooks&q=subject:$category",
      );

      BookModel bookModel = BookModel.fromJson(data);
      List<Item> books = bookModel.items ?? [];

      print("Fetched ${books.length} featured books");

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
