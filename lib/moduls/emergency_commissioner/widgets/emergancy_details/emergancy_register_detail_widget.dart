import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/core/core.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class EmergencyRegisterDetailWidget extends StatefulWidget {
  const EmergencyRegisterDetailWidget({super.key, required this.avarSearch});

  final AvarSearchEntity avarSearch;

  @override
  State<EmergencyRegisterDetailWidget> createState() => _EmergencyRegisterDetailWidgetState();
}

class _EmergencyRegisterDetailWidgetState extends State<EmergencyRegisterDetailWidget> {
  String? selectedCulprit;
  TextEditingController accidentCostController = TextEditingController();
  TextEditingController registrationIdController = TextEditingController();
  DateTime? accidentDate;
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    accidentCostController.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    accidentCostController.dispose();
    super.dispose();
  }

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
                widget.avarSearch.policyNumber ?? '',
              ),
              _textTitle(
                'ФИО владельца: ',
                widget.avarSearch.holderName ?? '',
              ),
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
              _textTitle(
                'Модель автомобиля: ',
                widget.avarSearch.carModel ?? '',
              ),
              _textTitle(
                'Марка автомобиля: ',
                widget.avarSearch.carBrand ?? '',
              ),
              _textTitle('Вин номер: ', widget.avarSearch.vinNumber ?? ''),
              _textTitle('VID номер: ', widget.avarSearch.vidNumber ?? ''),
              const Divider(color: AppColors.grey),
              _widgetTitle(
                'Дата аварии: ',
                DatePicker(
                  hintText: 'Выберите дату',
                  initialDate: accidentDate,
                  onDateChanged: (date) {
                    setState(() {
                      accidentDate = date;
                    });
                    _checkFormValidity();
                  },
                  onReset: () {
                    setState(() {
                      accidentDate = null;
                    });
                    _checkFormValidity();
                  },
                ),
              ),
              _widgetTitle(
                'Виновник аварии: ',
                CustomDropDown<String>(
                  hintText: 'Выберите виновника',
                  value: selectedCulprit,
                  items: (widget.avarSearch.availableDriversPins ?? [])
                      .map<DropdownItem<String>>(
                        (pin) => DropdownItem(
                          value: pin.toString(),
                          label: pin.toString(),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCulprit = value;
                    });
                    _checkFormValidity();
                  },
                ),
              ),
              _widgetTitle(
                'Номер РЗНУ: ',
                CustomTextField(
                  hintText: 'Введите номер РЗНУ',
                  controller: registrationIdController,
                ),
              ),
              const Divider(color: AppColors.grey),
              _widgetTitle(
                'Предварительная сумма',
                CustomTextField(
                  hintText: 'Введите сумму',
                  controller: accidentCostController,
                ),
              ),
                    
              const SizedBox(height: 50),
                    
              Row(
                children: [
                  Text(
                    'Потдвердить данные',
                    style: AppTypography.grey16w500,
                  ),
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
      ),
    );
  }

  void _onSend() {
    print(accidentDate);
    print(selectedCulprit);
    print(accidentCostController.text);
    print(registrationIdController.text);
  }

  void _checkFormValidity() {
    final isValid = accidentDate != null && 
                   selectedCulprit != null && 
                   selectedCulprit!.isNotEmpty &&
                   accidentCostController.text.isNotEmpty &&
                   registrationIdController.text.isNotEmpty;
    
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
