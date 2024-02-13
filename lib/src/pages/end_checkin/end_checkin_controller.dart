import 'package:et_lab_clinica_adm/src/models/patient_information_form_model.dart';
import 'package:et_lab_clinica_adm/src/services/call_next_patient/call_next_patient_service.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class EndCheckinController with MessageStateMixin {
  EndCheckinController({
    required CallNextPatientService callNextPatientService,
  }) : _callNextPatientService = callNextPatientService;

  CallNextPatientService _callNextPatientService;

  final informationForm = signal<PatientInformationFormModel?>(null);

  Future<void> callNextpatient() async {
    final result = await _callNextPatientService.execute();
    switch (result) {
      case Left():
        showError('Erro ao chamar o próximo paciente');

      case Right(value: final form?):
        informationForm.value = form;

      case _:
        showInfo('Nenhum paciente auardando!');
    }
  }
}
