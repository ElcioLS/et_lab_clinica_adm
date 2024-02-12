import 'package:et_lab_clinica_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:et_lab_clinica_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository_impl.dart';
import 'package:et_lab_clinica_adm/src/repositories/painel/painel_repository.dart';
import 'package:et_lab_clinica_adm/src/repositories/painel/painel_repository_impl.dart';
import 'package:et_lab_clinica_adm/src/repositories/patient_information_form/patient_information_form_repository_impl.dart';
import 'package:et_lab_clinica_adm/src/services/call_next_patient/call_next_patient_service.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../core/env.dart';
import '../repositories/patient_information_form/patient_information_form_repository.dart';

class LabClinicaApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton((i) => RestClient(
              Env.backendBaseUrl,
            )),
        Bind.lazySingleton<PatientInformationFormRepository>(
            (i) => PatientInformationFormRepositoryImpl(restClient: i())),
        Bind.lazySingleton<AttendantDeskAssignmentRepository>(
            (i) => AttendantDeskAssignmentRepositoryImpl(restClient: i())),
        Bind.lazySingleton<PainelRepository>(
            (i) => PainelRepositoryImpl(restClient: i())),
        Bind.lazySingleton((i) => CallNextPatientService(
            patientInformationFormRepository: i(),
            attendantDeskAssignmentRepository: i(),
            painelRepository: i())),
      ];
}
