import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assesment/config/local_database/hive_db_service.dart';
import 'package:flutter_assesment/features/home/domain/entities/popular.dart';
import 'package:flutter_assesment/features/home/presentation/widgets/popular/popular_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: Hive.box(HiveService.favorite).listenable(),
            builder: (context, box, child) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 24.w,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final key = box.keys.elementAt(index);
                    final value = box.get(key);
                    return PopularCard(popular: value as PopularEntity);
                  },
                ),
              );
            }),
      ),
    );
  }
}
