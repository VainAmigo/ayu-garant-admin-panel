import 'package:ayu_admin_panel/moduls/report/widgets/report_tabs_widget.dart';
import 'package:ayu_admin_panel/moduls/report/widgets/report_content_widget.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ReportTabsWidget(
                selectedIndex: _selectedTabIndex,
                onTabChanged: (index) {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
              ),
              ReportContentWidget(
                selectedIndex: _selectedTabIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
