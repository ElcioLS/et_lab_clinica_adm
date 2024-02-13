import 'package:et_lab_clinica_adm/src/pages/end_checkin/end_checkin_controller.dart';
import 'package:et_lab_clinica_adm/src/pages/end_checkin/end_checkin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class EndCheckinRouter extends FlutterGetItPageRouter {
  const EndCheckinRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
            (i) => EndCheckinController(callNextPatientService: i()))
      ];

  @override
  String get routeName => '/end-checkin';

  @override
  WidgetBuilder get view => (_) => const EndCheckinPage();
}
