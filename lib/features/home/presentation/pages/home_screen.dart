import 'package:flutter/material.dart';
import 'package:flutter_assesment/config/dummy_data/category_dummy_data.dart';
import 'package:flutter_assesment/config/local_database/hive_db_service.dart';
import 'package:flutter_assesment/config/routes/route_contants.dart';
import 'package:flutter_assesment/core/utils/spacing.dart';
import 'package:flutter_assesment/core/utils/svg_utils.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_event.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_event.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/category/category_section.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/popular/popular_section.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/section_heading.dart';
import 'package:flutter_assesment/gen/assets.gen.dart';
import 'package:flutter_assesment/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

// value notifier

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ListView(
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
                    onChanged: (value) async {
                      context
                          .read<PopularBloc>()
                          .add(SeachPopularsEvent(value));
                    },
                    cursorHeight: 24,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      hintText: "Enter name or category",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15.sp),
                      suffixIcon: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteConstants.searchResultsPage);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: SVGUtils.svgFromAsset(Assets.icons.search),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SpacingUtil.verticalSpacing(28.h),
              InkWell(
                onTap: () async {
                  // context.read<CategoryBloc>().add(GetCategoriesEvent());
                  context.read<PopularBloc>().add(GetPopularsEvent());

                  final data = await locator<HiveService>()
                      .getData(HiveService.savedPopular);
                  print(data.length);
                },
                child: const SectionHeading(
                  title: 'Category',
                ),
              ),
              SpacingUtil.verticalSpacing(16.h),
              CategorySection(categories: dummyCategories),
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
