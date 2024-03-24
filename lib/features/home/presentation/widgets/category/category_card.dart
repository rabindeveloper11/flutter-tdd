import 'package:flutter/material.dart';
import 'package:flutter_assesment/core/utils/svg_utils.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;
  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.only(top: 8, left: 8, right: 16, bottom: 8),
      decoration: ShapeDecoration(
        color: const Color(0xFFF8F8F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SVGUtils.svgFromAsset(category.image),
          const SizedBox(width: 8),
          Text(category.name, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
