import 'package:ayu_admin_panel/core/core.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class EmergancyApprovedDetailWidget extends StatelessWidget {
  const EmergancyApprovedDetailWidget({super.key, required this.avarSearch});

  final AvarSearchEntity avarSearch;

@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.defaultPadding,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Детали аварии', style: AppTypography.black20w400),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: AppColors.grey),
              ),
            ],
          ),
          // Content
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _textTitle(
                'Номер полиса: ',
                avarSearch.policyNumber ?? '',
              ),
              _textTitle(
                'ФИО владельца: ',
                avarSearch.holderName ?? '',
              ),
              _textTitle(
                'ПИН владельца: ',
                avarSearch.holderPin?.toString() ?? '',
              ),
              _textTitle(
                'Период действия: ',
                '${avarSearch.policyStartDate?.formatted} - ${avarSearch.policyEndDate?.formatted}',
              ),
              const Divider(color: AppColors.grey),
              _textTitle('Гос. номер: ', avarSearch.carNumber ?? ''),
              _textTitle(
                'Модель автомобиля: ',
                avarSearch.carModel ?? '',
              ),
              _textTitle(
                'Марка автомобиля: ',
                avarSearch.carBrand ?? '',
              ),
              _textTitle('Вин номер: ', avarSearch.vinNumber ?? ''),
              _textTitle('VID номер: ', avarSearch.vidNumber ?? ''),
              const Divider(color: AppColors.grey),
              _textTitle(
                'Номер РЗНУ: ',
                avarSearch.registrationId ?? '',
              ),
              _textTitle(
                'Дата аварии: ',
                avarSearch.accidentDate?.formatted ?? '',
              ),
              _textTitle(
                'ПИН виновника: ',
                avarSearch.culpritPin?.toString() ?? '',
              ),
              _textTitle(
                'ФИО виновника:',
                avarSearch.culpritName ?? '',
              ),
              const Divider(color: AppColors.grey),
              _textTitle(
                'Предварительная сумма',
                avarSearch.accidentCost?.toString() ?? '',
              ),
              const Divider(color: AppColors.grey),
              _textTitle(
                'Дата выплаты: ',
                avarSearch.paymentDate?.formatted ?? '',
              ),
              _textTitle(
                'Выплаченная сумма: ',
                avarSearch.paymentAmount?.toString() ?? '',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textTitle(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: AppTypography.grey16w500),
          const Spacer(),
          Text(value, style: AppTypography.black16w600),
        ],
      ),
    );
  }
}