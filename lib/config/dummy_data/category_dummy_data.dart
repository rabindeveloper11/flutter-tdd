import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/gen/assets.gen.dart';

final List<CategoryEntity> dummyCategories = [
  CategoryEntity(
    id: '1',
    name: 'Top 30 Places',
    image: Assets.icons.top30,
  ),
  CategoryEntity(
    id: '2',
    name: 'Nature',
    image: Assets.icons.nature,
  ),
  CategoryEntity(
    id: '3',
    name: 'Gastro',
    image: Assets.icons.food,
  ),
];
