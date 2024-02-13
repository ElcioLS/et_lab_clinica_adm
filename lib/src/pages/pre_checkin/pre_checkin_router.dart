import 'package:et_lab_clinica_adm/src/models/patient_information_form_model.dart';
import 'package:et_lab_clinica_adm/src/pages/pre_checkin/pre_checkin_contoller.dart';
import 'package:et_lab_clinica_adm/src/pages/pre_checkin/pre_checkin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class PreCheckinRouter extends FlutterGetItPageRouter {
  const PreCheckinRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
            (i) => PreCheckinContoller(callNextPatientService: i()))
      ];

  @override
  String get routeName => '/pre-checkin';

  @override
  WidgetBuilder get view => (context) {
        final form = ModalRoute.of(context)!.settings.arguments
            as PatientInformationFormModel;

        context.get<PreCheckinContoller>().informationForm.value = form;

        return const PreCheckinPage();
      };
}
