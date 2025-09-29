import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.text,
    required this.number,
    required this.isSelected,
    required this.isDot,
    this.dotColor,
    this.onTap,
  });

  final String text;
  final String number;
  final bool isSelected;
  final bool isDot;
  final Color? dotColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isDot
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Dot(color: dotColor ?? AppColors.grey),
                      const Spacer(),
                      Text(
                        number,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? AppColors.white : AppColors.grey,
                        ),
                      ),
                    ],
                  )
                : Text(
                    textAlign: TextAlign.left,
                    number,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
            const SizedBox(height: 30),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? AppColors.white : AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
