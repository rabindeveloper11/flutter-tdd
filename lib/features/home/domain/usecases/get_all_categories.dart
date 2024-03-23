import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/features/home/domain/repositories/category_repository.dart';

class GetAllCategoriesUserCase {
  final CategoryRepository repository;

  GetAllCategoriesUserCase(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return repository.getCategories();
  }
}
