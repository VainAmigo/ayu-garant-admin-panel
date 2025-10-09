import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

Widget whiteContainer(EdgeInsets padding, Widget child) {
  return Container(
    padding: padding,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: child,
  );
}