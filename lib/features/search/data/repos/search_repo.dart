import 'package:bokly_app/core/errors/failure.dart';
import 'package:bokly_app/features/home/data/models/book_model/item.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<Item>>> searchBooks({required String category});
}
