import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:flutter/material.dart';

class CheckinImageLink extends StatelessWidget {
  const CheckinImageLink({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: LabClinicaTheme.blueColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
