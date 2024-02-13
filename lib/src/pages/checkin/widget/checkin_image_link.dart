import 'package:et_lab_clinica_adm/src/pages/checkin/widget/checkin_image_dialog.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:flutter/material.dart';

class CheckinImageLink extends StatelessWidget {
  const CheckinImageLink({required this.label, required this.image});

  final String label;
  final String image;

  void showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CheckinImageDialog(context, pathImage: image);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showImageDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: LabClinicaTheme.blueColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
