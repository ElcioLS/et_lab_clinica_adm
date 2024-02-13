import 'package:flutter/material.dart';

import '../../../core/env.dart';

class CheckinImageDialog extends AlertDialog {
  CheckinImageDialog(BuildContext context,
      {super.key, required String pathImage})
      : super(
          content: Image.network(
            '${Env.backendBaseUrl}/$pathImage',
            fit: BoxFit.cover,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('FECHAR'))
          ],
        );
}
