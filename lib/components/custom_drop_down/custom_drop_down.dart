import 'package:flutter/material.dart';
import 'package:ayu_admin_panel/themes/themes.dart';

class CustomDropDown<T> extends StatefulWidget {
  final String hintText;
  final List<DropdownItem<T>>? items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final bool enabled;

  const CustomDropDown({
    super.key,
    this.hintText = 'Вид страховки',
    this.items,
    this.value,
    this.onChanged,
    this.enabled = true,
  });

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  static const List<DropdownItem<String>> _insuranceItems = [
    DropdownItem(value: 'OSAGO', label: 'ОСАГО'),
    DropdownItem(value: 'CASCO', label: 'КАСКО'),
    DropdownItem(value: 'mini-CASCO', label: 'мини КАСКО'),
    DropdownItem(value: 'DSAGO', label: 'ДСАГО'),
    DropdownItem(value: 'all', label: 'Все'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 34,
      child: DropdownButtonFormField<T>(
        value: widget.value,
        onChanged: widget.enabled ? widget.onChanged : null,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.grey,
            size: 20,
          ),
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: AppColors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: AppColors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 7,
          ),
        ),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        items: (widget.items ?? _insuranceItems.cast<DropdownItem<T>>()).map((DropdownItem<T> item) {
          return DropdownMenuItem<T>(
            value: item.value,
            child: Text(
              item.label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
          );
        }).toList(),
        isExpanded: true,
      ),
    );
  }
}

class DropdownItem<T> {
  final T value;
  final String label;

  const DropdownItem({required this.value, required this.label});
}
