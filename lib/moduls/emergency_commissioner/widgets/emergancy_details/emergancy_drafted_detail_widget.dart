import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/core/core.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class EmergancyDraftedDetailWidget extends StatefulWidget {
  const EmergancyDraftedDetailWidget({super.key, required this.avarSearch});

  final AvarSearchEntity avarSearch;

  @override
  State<EmergancyDraftedDetailWidget> createState() =>
      _EmergancyDraftedDetailWidgetState();
}

class _EmergancyDraftedDetailWidgetState
    extends State<EmergancyDraftedDetailWidget> {
  TextEditingController paymentAmountController = TextEditingController();
  bool _isFormValid = false;
  DateTime? paymentDate;

  @override
  void initState() {
    super.initState();
    paymentAmountController.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    paymentAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            _textTitle('Номер полиса: ', widget.avarSearch.policyNumber ?? ''),
            _textTitle('ФИО владельца: ', widget.avarSearch.holderName ?? ''),
            _textTitle(
              'ПИН владельца: ',
              widget.avarSearch.holderPin?.toString() ?? '',
            ),
            _textTitle(
              'Период действия: ',
              '${widget.avarSearch.policyStartDate?.formatted} - ${widget.avarSearch.policyEndDate?.formatted}',
            ),
            const Divider(color: AppColors.grey),
            _textTitle('Гос. номер: ', widget.avarSearch.carNumber ?? ''),
            _textTitle('Модель автомобиля: ', widget.avarSearch.carModel ?? ''),
            _textTitle('Марка автомобиля: ', widget.avarSearch.carBrand ?? ''),
            _textTitle('Вин номер: ', widget.avarSearch.vinNumber ?? ''),
            _textTitle('VID номер: ', widget.avarSearch.vidNumber ?? ''),
            const Divider(color: AppColors.grey),
            _textTitle('Номер РЗНУ: ', widget.avarSearch.registrationId ?? ''),
            _textTitle(
              'Дата аварии: ',
              widget.avarSearch.accidentDate?.formatted ?? '',
            ),
            _textTitle(
              'ПИН виновника: ',
              widget.avarSearch.culpritPin?.toString() ?? '',
            ),
            _textTitle('ФИО виновника:', widget.avarSearch.culpritName ?? ''),
            const Divider(color: AppColors.grey),
            _textTitle(
              'Предварительная сумма',
              widget.avarSearch.accidentCost?.toString() ?? '',
            ),
            const Divider(color: AppColors.grey),
            _widgetTitle(
              'Дата выплаты: ',
              DatePicker(
                hintText: 'Выберите дату',
                onDateChanged: (date) {
                  setState(() {
                    paymentDate = date;
                  });
                  _checkFormValidity();
                },
                onReset: () {
                  setState(() {
                    paymentDate = null;
                  });
                  _checkFormValidity();
                },
              ),
            ),
            _widgetTitle(
              'Сумма к выплате: ',
              CustomTextField(
                hintText: 'Введите сумму',
                controller: paymentAmountController,
              ),
            ),

            const SizedBox(height: 50),

            Row(
              children: [
                Text('Потдвердить данные', style: AppTypography.grey16w500),
                const Spacer(),
                PrimaryButton(
                  text: 'Отправить',
                  onPressed: _isFormValid ? _onSend : null,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  void _onSend() {
    print(paymentAmountController.text);
  }

  void _checkFormValidity() {
    final isValid =
        paymentAmountController.text.isNotEmpty && paymentDate != null;

    if (_isFormValid != isValid) {
      setState(() {
        _isFormValid = isValid;
      });
    }
  }

  Widget _widgetTitle(String title, Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: AppTypography.grey16w500),
          const Spacer(),
          child,
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
