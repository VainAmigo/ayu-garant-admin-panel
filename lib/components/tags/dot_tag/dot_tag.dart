import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class DotTag extends StatelessWidget {
  const DotTag({super.key, required this.isSelected, required this.text});

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: isSelected ? AppColors.primary : AppColors.grey,
        )
      ),
      height: 34,
      width: 34,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: isSelected ? AppColors.white : AppColors.grey
          ),
        ),
      ),
    );
  }
}