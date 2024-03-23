import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
  });
  final String id;
  final String name;
  final String image;

  @override
  List<Object?> get props => [id, name, image];
}
