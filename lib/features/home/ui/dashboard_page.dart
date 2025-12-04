import 'package:flutter/material.dart';
import '../../auth/data/models/auth_models.dart';

class DashboardPage extends StatelessWidget {
  final AuthResponse authResponse;

  const DashboardPage({super.key, required this.authResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome!'),
            const SizedBox(height: 16),
            Text('Token: ${authResponse.token}'),
            const SizedBox(height: 16),
            Text('Roles: ${authResponse.roles.join(', ')}'),
            const SizedBox(height: 16),
            Text('Accessible Pages:'),
            ...authResponse.accessiblePages.map((page) => Text(page)),
          ],
        ),
      ),
    );
  }
}
