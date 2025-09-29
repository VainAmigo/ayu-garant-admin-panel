import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AnalyticSystemStat extends StatelessWidget {
  final double androidPercentage;
  final double iosPercentage;

  const AnalyticSystemStat({
    super.key,
    this.androidPercentage = 67.0,
    this.iosPercentage = 33.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildAndroidSegment(), 
              _buildIosSegment(),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildAndroidSegment() {
    final minWidth = 0.2;
    final actualPercentage = androidPercentage / 100;
    final displayPercentage = actualPercentage < minWidth ? minWidth : actualPercentage;
    
    return Expanded(
      flex: (displayPercentage * 100).round(),
      child: Container(
        height: 54,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: AppColors.primary50,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(100),
            bottomLeft: Radius.circular(100),
          ),
        ),
        child: Row(
          spacing: 10,
          children: [
            const Icon(Icons.android, color: Colors.white, size: 20),
            const Text(
              'ANDROID',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const Spacer(),
            Text(
              '${androidPercentage.round()}%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIosSegment() {
    final minWidth = 0.2;
    final actualPercentage = iosPercentage / 100;
    final displayPercentage = actualPercentage < minWidth ? minWidth : actualPercentage;
    
    return Expanded(
      flex: (displayPercentage * 100).round(),
      child: Container(
        height: 54,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: AppColors.primary75,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
        child: Row(
          spacing: 10,
          children: [
            const Icon(Icons.phone_iphone, color: Colors.white, size: 20),
            const Text(
              'iOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const Spacer(),
            Text(
              '${iosPercentage.round()}%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
