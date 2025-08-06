import 'package:bokly_app/core/errors/Failure.dart';
import 'package:bokly_app/core/utils/api_service.dart';
import 'package:bokly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bokly_app/features/home/data/models/book_model/item.dart';
import 'package:bokly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepo {
  ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<Item>>> fetchBestNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming",
      );

      BookModel bookModel = BookModel.fromJson(data);
      List<Item> books = bookModel.items ?? [];

      return right(books);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
