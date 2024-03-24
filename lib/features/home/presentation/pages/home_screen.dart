import 'package:flutter/material.dart';
import 'package:flutter_assesment/core/utils/spacing.dart';
import 'package:flutter_assesment/core/utils/svg_utils.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/category/category_section.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/popular/popular_section.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/section_heading.dart';
import 'package:flutter_assesment/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

// value notifier



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "GoGo",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SpacingUtil.verticalSpacing(8.h),
                      Text(
                        "Choose Another",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SVGUtils.svgFromAsset(Assets.icons.map)
                ],
              ),
              SpacingUtil.verticalSpacing(24.h),
              Container(
                width: 327.w,
                height: 52.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF8F8F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Center(
                  child: TextField(
                    cursorHeight: 24,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: "Enter name or category",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15.sp),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SVGUtils.svgFromAsset(Assets.icons.search),
                      ),

                      // border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SpacingUtil.verticalSpacing(28.h),
              const SectionHeading(
                title: 'Category',
              ),
              SpacingUtil.verticalSpacing(16.h),
              CategorySection(categories: [
                CategoryEntity(
                    id: "1", name: "Top 30 places", image: Assets.icons.top30),
                CategoryEntity(
                    id: "2", name: "Nature", image: Assets.icons.nature),
                CategoryEntity(id: "3", name: "City", image: Assets.icons.food),
              ]),
              SpacingUtil.verticalSpacing(28.h),
              const SectionHeading(
                title: 'Popular',
              ),
              SpacingUtil.verticalSpacing(15.h),
              const PopularSection(categories: []),
            ],
          ),
        ),
      ),
   );
  }
}
