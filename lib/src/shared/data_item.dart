import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  const DataItem({
    super.key,
    required this.label,
    required this.value,
    this.padding,
  });

  final String label;
  final String value;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    Widget widget = Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 14,
            color: LabClinicaTheme.blueColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 14,
            color: LabClinicaTheme.orangeColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );

    if (padding != null) {
      widget = Padding(
        padding: padding!,
        child: widget,
      );
    }
    return widget;
  }
}
