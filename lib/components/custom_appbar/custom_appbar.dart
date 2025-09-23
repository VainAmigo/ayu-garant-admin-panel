import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: AppBar(
        toolbarHeight: 100,
        title: Text('data'),
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
