import 'package:flutter/material.dart';

import '../../exports.dart';


class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget(
      {super.key, required this.isSelected, required this.onCheck});

  final bool isSelected;
  final Function(bool? check) onCheck;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: AppColors.primaryColor,
      hoverColor: Colors.white,
      fillColor:
          WidgetStatePropertyAll(isSelected ? AppColors.primaryColor : Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      value: isSelected,
      onChanged: onCheck,
    );
  }
}
