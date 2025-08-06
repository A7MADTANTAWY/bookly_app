import 'package:bokly_app/core/errors/Failure.dart';
import 'package:bokly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSEllerBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
