import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  
  const CustomAppBar({super.key, required this.title});

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
        backgroundColor: AppColors.white,
        title: Text(title),
        centerTitle: true,
        actions: [const CustomSearchBar(hintText: 'Поиск по номеру Полиса')],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
