import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class EmergencyCommissionerView extends StatefulWidget {
  const EmergencyCommissionerView({super.key});

  @override
  State<EmergencyCommissionerView> createState() => _EmergencyCommissionerViewState();
}

class _EmergencyCommissionerViewState extends State<EmergencyCommissionerView> {
  TabType _selectedTab = TabType.registered;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.defaultPadding),
          child: Column(
            spacing: AppSpacing.defaultPadding,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmergencyCommissionerTabsWidget(
                selectedTab: _selectedTab,
                onTabSelected: _selectTab,
              ),
              _buildReportContent(),
            ],
          ),
        ),
      ),
    );
  }
    void _selectTab(TabType tabType) {
    setState(() {
      _selectedTab = tabType;
    });
  }

  Widget _buildReportContent() {
    switch (_selectedTab) {
      case TabType.registered:
        return EmergencyRegisterTab();
      case TabType.drafted:
        return EmergencyDraftedTab();
      case TabType.approved:
        return EmergencyApprovedTab();
    }
  }
}

enum TabType {
  registered('Регистрация аварии', AppColors.primary25, '10'),
  drafted('Черновик аварии', AppColors.primary75, '101'),
  approved('Зарегистрированная авария', AppColors.primary50, '2343');

  const TabType(this.title, this.color, this.count,);
  final String title;
  final Color color;
  final String count;
}