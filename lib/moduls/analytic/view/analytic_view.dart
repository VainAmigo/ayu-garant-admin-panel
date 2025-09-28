import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:flutter/material.dart';

class AnalyticView extends StatelessWidget {
  const AnalyticView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnalyticFilter(),

            const SizedBox(height: 20),

            
          ],
        ),
      )
    );
  }
}
