import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.isSelected,
    required this.title,
    required this.icon,
  });

  final bool isSelected;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      width: 270,
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.white : AppColors.grey,
            size: 48,
          ),
          const Spacer(),
          Text(
            title, 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: isSelected ? AppColors.white : AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
