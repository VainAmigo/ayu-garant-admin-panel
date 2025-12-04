import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/dio_client.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/logic/bloc/auth_bloc.dart';
import 'features/auth/ui/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection
    final dioClient = DioClient();
    final authRepository = AuthRepository(dioClient);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>.value(value: authRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepository)),
        ],
        child: MaterialApp(
          title: 'Admin Panel',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginPage(),
        ),
      ),
    );
  }
}
