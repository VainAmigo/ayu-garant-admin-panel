import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class TextTag extends StatelessWidget {
  const TextTag({super.key, required this.color, required this.text,});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      height: 24,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10,
          color: AppColors.white,
        ),
      ),
    );
  }
}