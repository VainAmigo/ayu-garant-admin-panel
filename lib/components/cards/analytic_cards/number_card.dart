import 'package:ayu_admin_panel/components/components.dart';
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
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Responsive(
        mobile: AnalyticCardMobile(number: number, text: text),
        tablet: AnalyticCardDesktop(number: number, text: text),
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
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        const Spacer(),
        Text(text, style: TextStyle(fontSize: 16, color: AppColors.grey)),
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
        Text(number, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.black),),
        const Spacer(),
        Text(text, style: TextStyle(fontSize: 16, color: AppColors.grey),),
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
        Text(number, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.black),),
        const Spacer(),
        Text(text, style: TextStyle(fontSize: 20, color: AppColors.grey),),
      ],
    );
  }
}
