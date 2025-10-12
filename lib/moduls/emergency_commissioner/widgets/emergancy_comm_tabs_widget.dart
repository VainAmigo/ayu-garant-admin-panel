import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class EmergencyCommissionerTabsWidget extends StatelessWidget {
  const EmergencyCommissionerTabsWidget({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  final TabType selectedTab;
  final Function(TabType) onTabSelected;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Responsive(
      mobile: EmergencyCommissionerTabsGridView(
        crossAxisCount: 2,
        childAspectRatio: size.width < 650 ? 1.2 : 1.9,
        selectedTab: selectedTab,
        onTabSelected: onTabSelected,
        iconSize: size.width > 420 ? 50 : 40,
      ),
      tablet: EmergencyCommissionerTabsGridView(
        crossAxisCount: 3,
        childAspectRatio: size.width < 900 ? 1.2 : 1.5,
        selectedTab: selectedTab,
        onTabSelected: onTabSelected,
        iconSize: 50,
      ),
      desktop: EmergencyCommissionerTabsGridView(
        crossAxisCount: 3,
        childAspectRatio: size.width > 1300 ? 3 : 1.8,
        selectedTab: selectedTab,
        onTabSelected: onTabSelected,
        iconSize: size.width > 1380 ? 100 : 80,
      ),
    );
  }
}

class EmergencyCommissionerTabsGridView extends StatelessWidget {
  const EmergencyCommissionerTabsGridView({
    super.key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.4,
    required this.selectedTab,
    required this.onTabSelected,
    this.iconSize,
  });

  final int crossAxisCount;
  final double childAspectRatio;
  final TabType selectedTab;
  final Function(TabType) onTabSelected;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: AppSpacing.defaultPadding,
        mainAxisSpacing: AppSpacing.defaultPadding,
      ),
      children: TabType.values.map((tabType) {
        return AvarTabCard(
          title: tabType.title,
          count: tabType.count,
          isActive: selectedTab == tabType,
          onTap: () => onTabSelected(tabType),
          dotColor: tabType.color,
        );
      }).toList(),
    );
  }
}
