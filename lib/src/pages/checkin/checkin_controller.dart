import 'package:et_lab_clinica_adm/src/models/patient_information_form_model.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CheckinController with MessageStateMixin {
  final informationForm = signal<PatientInformationFormModel?>(null);
}
