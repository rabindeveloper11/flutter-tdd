import 'package:flutter/material.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/category/category_card.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/popular/popular_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularSection extends StatelessWidget {
  final List<CategoryEntity> categories;
  const PopularSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        // children: categories
        //     .map((category) => Padding(
        //           padding: EdgeInsets.only(right: 12.sp),
        //           child: CategoryCard(category: category),
        //         ))
        //     .toList(),

        children: List.generate(
            3,
            (index) => Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: PopularCard(),
                )),
      ),
    );
  }
}
