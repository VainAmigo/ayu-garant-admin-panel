import 'package:ayu_admin_panel/components/cards/cards.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AnlyticCardsGrid extends StatelessWidget {
  const AnlyticCardsGrid({super.key, required this.analyticData});

  final AnalyticEntity analyticData;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Responsive(
      mobile: AnalyticInfoCardGridView(
        analyticData: analyticData,
        crossAxisCount: size.width < 650 ? 1 : 2,
        childAspectRatio: size.width < 650 && size.width > 350 ? 5 : 4,
      ),
      tablet: AnalyticInfoCardGridView(
        analyticData: analyticData,
        childAspectRatio: 1.1,
      ),
      desktop: AnalyticInfoCardGridView(
        analyticData: analyticData,
        childAspectRatio: size.width < 1400 && size.width > 1300 ? 1.5 : 1.2,
      ),
    );
  }
}

class AnalyticInfoCardGridView extends StatelessWidget {
  const AnalyticInfoCardGridView({
    super.key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.4,
    required this.analyticData,
  });

  final int crossAxisCount;
  final double childAspectRatio;
  final AnalyticEntity analyticData;

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: AppSpacing.defaultPadding,
        mainAxisSpacing: AppSpacing.defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      children: [
        AnalyticCard(
          text: 'Всего полисов',
          number: analyticData.totalPolicies.toString(),
        ),
        AnalyticCard(
          text: 'Купленые полиса',
          number: analyticData.purchasedPolicies.toString(),
        ),
        AnalyticCard(
          text: 'Начислено балов',
          number: analyticData.financialData.accruedBonuses.toString(),
        ),
      ],
    );
  }
}
