import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class DotTextTag extends StatelessWidget {
  const DotTextTag({super.key, required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.white,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 34,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.white : AppColors.white,
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: isSelected ? AppColors.white : AppColors.grey,
              ),
            ),
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 10),
          Text(
            text, 
            style: TextStyle(
              fontSize: 12, 
              color: isSelected ? AppColors.white : AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
