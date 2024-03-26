import 'package:flutter/material.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_event.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_state.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/popular/popular_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularSection extends StatelessWidget {
  final List<CategoryEntity> categories;
  const PopularSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    context.read<PopularBloc>().add(const GetPopularsEvent());
    return BlocBuilder<PopularBloc, PopularState>(
      builder: (context, state) {
        if (state is PopularLoading) {
          return Container(
              constraints: BoxConstraints(minHeight: 52.h),
              child: const Center(child: CircularProgressIndicator.adaptive()));
        }

        if (state is PopularError) {
          return Center(child: Text(state.message));
        }

        if (state is PopularLoaded) {
          return state.populars.isEmpty
              ? Container(
                  constraints: BoxConstraints(minHeight: 52.h),
                  child: const Center(child: Text('No Populars Found')))
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.populars
                        .map((popular) => Padding(
                              padding: EdgeInsets.only(right: 12.sp),
                              child: PopularCard(popular: popular),
                            ))
                        .toList(),
                  ),
                );
        }

        return SizedBox();
      },
    );
  }
}
