import 'package:flutter/material.dart';
import 'package:flutter_assesment/config/routes/route.dart';
import 'package:flutter_assesment/config/theme/app_theme.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:flutter_assesment/landing_page.dart';
import 'package:flutter_assesment/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locator<CategoryBloc>()),
          BlocProvider(create: (_) => locator<PopularBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter TDD with Clean Architecture',
          theme: themeData,
          home: LandingPage(),
          onGenerateRoute: Routes.generateRoute,
        ),
      ),
    );
  }
}
