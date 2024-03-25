import 'package:flutter_assesment/features/home/data/models/category_model.dart';
import 'package:flutter_assesment/gen/assets.gen.dart';

final List<CategoryModel> dummyCategories = [
  CategoryModel(
    id: '1',
    name: 'Top 30 Places',
    image: Assets.icons.top30,
  ),
  CategoryModel(
    id: '2',
    name: 'Nature',
    image: Assets.icons.nature,
  ),
  CategoryModel(
    id: '3',
    name: 'Gastro',
    image: Assets.icons.food,
  ),
];
