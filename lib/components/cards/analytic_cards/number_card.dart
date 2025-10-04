import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AnalyticCard extends StatelessWidget {
  const AnalyticCard({super.key, required this.text, required this.number});

  final String text;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(AppSpacing.defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Responsive(
        mobile: AnalyticCardMobile(number: number, text: text),
        tablet: AnalyticCardTablet(number: number, text: text),
        desktop: AnalyticCardDesktop(number: number, text: text),
      ),
    );
  }
}

class AnalyticCardMobile extends StatelessWidget {
  const AnalyticCardMobile({
    super.key,
    required this.number,
    required this.text,
  });

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          number,
          style: AppTypography.black32w600,
        ),
        const Spacer(),
        Text(text, style: AppTypography.grey16w500),
      ],
    );
  }
}

class AnalyticCardTablet extends StatelessWidget {
  const AnalyticCardTablet({super.key, required this.number, required this.text});

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(number, style: AppTypography.black32w600,),
        const Spacer(),
        Text(text, style: AppTypography.grey16w500,),
      ],
    );
  }
}

class AnalyticCardDesktop extends StatelessWidget {
  const AnalyticCardDesktop({
    super.key,
    required this.number,
    required this.text,
  });

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(number, style: AppTypography.black32w600,),
        const Spacer(),
        Text(text, style: AppTypography.grey16w500.copyWith(fontSize: 20),),
      ],
    );
  }
}
