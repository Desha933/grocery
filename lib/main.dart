import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:grocery/features/on_boarding/presentation/screens/on_boarding_first_screen.dart';
import 'package:grocery/init_dependencies.main.dart';

void main() async {
  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      child: BlocProvider(
        create: (context) => serviceLocator<AuthBloc>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const OnBoardingFirstScreen(),
        ),
      ),
    );
  }
}
