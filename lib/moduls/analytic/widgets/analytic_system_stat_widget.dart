import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AnalyticSystemStat extends StatelessWidget {
  final List<Map<String, dynamic>> analyticData;

  const AnalyticSystemStat({
    super.key,
    required this.analyticData,
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
              _buildSegment(isAndroid: true, context: context),
              _buildSegment(isAndroid: false, context: context),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildSegment({required bool isAndroid, required BuildContext context}) {
    final minWidth = Responsive.isDesktop(context) ? 0.3 : 0.4;
    final platformPercentage = analyticData.isNotEmpty ? analyticData[0][isAndroid ? 'androidPercentage' : 'iosPercentage'] ?? 0 : 0;
    final actualPercentage = platformPercentage / 100;
    final displayPercentage = actualPercentage < minWidth ? minWidth : actualPercentage;
    
    return Expanded(
      flex: (displayPercentage * 100).round(),
      child: Container(
        height: 54,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: isAndroid ? AppColors.primary50 : AppColors.primary75,
          borderRadius: isAndroid ? const BorderRadius.only(
            topLeft: Radius.circular(100),
            bottomLeft: Radius.circular(100),
          ) : const BorderRadius.only(
            topRight: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
        child: Row(
          spacing: 10,
          children: [
            Icon(isAndroid ? Icons.android : Icons.phone_iphone, color: Colors.white, size: 20),
            if (!Responsive.isMobile(context))
              Text(
              isAndroid ? 'ANDROID' : 'iOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: Responsive.isTablet(context) ? 10 : 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const Spacer(),
            Text(
              '${platformPercentage.round()}%',
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