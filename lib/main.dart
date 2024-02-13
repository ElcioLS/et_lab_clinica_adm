import 'dart:async';
import 'dart:developer';

import 'package:et_lab_clinica_adm/src/pages/checkin/checkin_router.dart';
import 'package:et_lab_clinica_adm/src/pages/pre_checkin/pre_checkin_router.dart';
import 'package:et_lab_clinica_adm/src/pages/splash/splash_page.dart';
import 'package:et_lab_clinica_adm/src/bindings/lab_clinica_application_binding.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'src/pages/home/home_router.dart';
import 'src/pages/login/login_router.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(const LabClinicaAdm());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicaAdm extends StatelessWidget {
  const LabClinicaAdm({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicaCoreConfig(
      title: 'Lab Clinica ADM',
      binding: LabClinicaApplicationBinding(),
      pagesBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/'),
      ],
      pages: const [
        LoginRouter(),
        HomeRouter(),
        PreCheckinRouter(),
        CheckinRouter(),
      ],
    );
  }
}
