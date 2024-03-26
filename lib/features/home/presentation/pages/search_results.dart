import 'package:flutter/material.dart';
import 'package:flutter_assesment/core/utils/spacing.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_state.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_state.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/category/category_card.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/popular/popular_card.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/section_heading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchedCategoriesSection(),
          SearchedPopularsSections(),
        ],
      ),
    );
  }
}

class SearchedCategoriesSection extends StatelessWidget {
  const SearchedCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CategoryError) {
          return Center(child: Text(state.message));
        }

        if (state is CategoryLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacingUtil.verticalSpacing(24.h),
                const SectionHeading(
                  title: 'Category',
                ),
                if (state.categories.isEmpty)
                  Container(
                      constraints: BoxConstraints(minHeight: 200.h),
                      child: const Center(child: Text('No categories found'))),
                SpacingUtil.verticalSpacing(16.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      state.categories.length,
                      (index) {
                        final data = state.categories[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 16.0.w),
                          child: CategoryCard(
                            category: data,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SpacingUtil.verticalSpacing(32.h),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}

class SearchedPopularsSections extends StatelessWidget {
  const SearchedPopularsSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBloc, PopularState>(
      builder: (context, state) {
        if (state is PopularLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PopularError) {
          return Center(child: Text(state.message));
        }

        if (state is PopularLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SectionHeading(
                  title: 'Populars',
                ),
                SpacingUtil.verticalSpacing(24.h),
                if (state.populars.isEmpty)
                  Container(
                    constraints: BoxConstraints(minHeight: 200.h),
                    child: const Center(
                      child: Text('No populars found'),
                    ),
                  ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(state.populars.length, (index) {
                      final popular = state.populars[index];
                      return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: PopularCard(
                            popular: popular,
                          ));
                    }),
                  ),
                )
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
