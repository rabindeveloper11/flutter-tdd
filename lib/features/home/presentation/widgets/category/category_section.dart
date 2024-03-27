import 'package:flutter/material.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_event.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_state.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/category/category_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySection extends StatelessWidget {
  final List<CategoryEntity> categories;
  const CategorySection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(const GetCategoriesEvent());
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return Container(
              constraints: BoxConstraints(minHeight: 52.h),
              child: const Center(child: CircularProgressIndicator.adaptive()));
        }

        if (state is CategoryError) {
          return Center(child: Text(state.message));
        }

        if (state is CategoryLoaded) {
          return state.categories.isEmpty
              ? Container(
                  constraints: BoxConstraints(minHeight: 52.h),
                  child: const Center(child: Text('No Categories Found')))
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.categories
                        .map((category) => Padding(
                              padding: EdgeInsets.only(right: 12.sp),
                              child: CategoryCard(category: category),
                            ))
                        .toList(),
                  ),
                );
        }

        return const SizedBox();
      },
    );
  }
}
