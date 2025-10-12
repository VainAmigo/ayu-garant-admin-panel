import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'themes/app_theme/app_theme.dart';

void main() async {
  final storage = await PreferencesStorage.getInstance();

  final remoteClient = RemoteClient(
    dio: Dio(BaseOptions(baseUrl: 'https://')),
    token: () => storage.readString(key: 'access_token'),
    network: NetworkClient(Connectivity()),
    storage: storage,
  )..initilize();

  final dataSource = RemoteDataSource(remoteClient);
  final repository = RepositoryImpl(dataSource);

  runApp(
    RepositoryProvider<Repository>(
      create: (context) => repository,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AnalyticBloc(
            context.read<Repository>()
          ),
        ),
        BlocProvider(
          create: (context) => ReportCubit(
            context.read<Repository>()
          ),
        ),
        BlocProvider(
          create: (context) => UsersCubit(
            context.read<Repository>()
          ),
        ),
        BlocProvider(
          create: (context) => EmergancyCommCubit(
            context.read<Repository>()
          ),
        ),
      ],
      child: const AdminPanel(),
    );
  }
}

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AYU Admin Panel',
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRouter.main,
      theme: const AppTheme().themeData,
      home: AppMainView(),
    );
  }
}
