import 'package:et_lab_clinica_adm/src/models/patient_information_form_model.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../services/call_next_patient/call_next_patient_service.dart';

class PreCheckinContoller with MessageStateMixin {
  PreCheckinContoller({
    required CallNextPatientService callNextPatientService,
  }) : _callNextPatientService = callNextPatientService;

  final CallNextPatientService _callNextPatientService;

  final informationForm = signal<PatientInformationFormModel?>(null);

  Future<void> next() async {
    final result = await _callNextPatientService.execute();
    switch (result) {
      case Left():
        showError('Erro ao chamar paciente');
      case Right(value: final form?):
        informationForm.value = form;
      case Right():
        showInfo('Nenhum paciente aguardando!');
    }
  }
}
