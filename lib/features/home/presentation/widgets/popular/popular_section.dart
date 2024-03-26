import 'package:flutter/material.dart';
import 'package:flutter_assesment/config/dummy_data/popular_dummy_data.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/popular/popular_card.dart';

class PopularSection extends StatelessWidget {
  final List<CategoryEntity> categories;
  const PopularSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            popularDummyData.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: PopularCard(
                    popular: popularDummyData[index],
                  ),
                )),
      ),
    );
  }
}
