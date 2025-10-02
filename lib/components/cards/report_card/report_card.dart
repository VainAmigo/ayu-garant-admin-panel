import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.isSelected,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final bool isSelected;
  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.white : AppColors.grey,
                size: 40,
              ),
              const Spacer(),
              Text(
                title, 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: isSelected ? AppColors.white : AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
