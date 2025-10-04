import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'themes/app_theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AYU Admin Panel',
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRouter.main,
      theme: const AppTheme().themeData,
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => MenuCubit())],
        child: AppMainView(),
      ),
    );
  }
}
