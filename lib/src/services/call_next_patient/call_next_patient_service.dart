import 'dart:developer';

import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';

import '../../models/patient_information_form_model.dart';
import '../../repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import '../../repositories/painel/painel_repository.dart';
import '../../repositories/patient_information_form/patient_information_form_repository.dart';

class CallNextPatientService {
  CallNextPatientService({
    required this.patientInformationFormRepository,
    required this.attendantDeskAssignmentRepository,
    required this.painelRepository,
  });

  final PatientInformationFormRepository patientInformationFormRepository;
  final AttendantDeskAssignmentRepository attendantDeskAssignmentRepository;
  final PainelRepository painelRepository;

  Future<Either<RepositoryException, PatientInformationFormModel?>>
      execute() async {
    final result = await patientInformationFormRepository.callNextToCheckin();

    switch (result) {
      case Left(value: final exception):
        return Left(exception);
      case Right(value: final form?):
        return updatePainel(form);
      case Right():
        return Right(null);
    }
  }

  Future<Either<RepositoryException, PatientInformationFormModel?>>
      updatePainel(PatientInformationFormModel form) async {
    final resultDesk =
        await attendantDeskAssignmentRepository.getDeskAssignment();
    switch (resultDesk) {
      case Left(value: final exception):
        return Left(exception);
      case Right(value: final deskNumber):
        final painelResult = await painelRepository.callOnPainel(
            form.password, deskNumber as int);

        switch (painelResult) {
          case Left(value: final exception):
            log(
              'ATENÇÃO! Não foi possível chamar o paciente',
              error: exception,
              stackTrace: StackTrace.fromString(
                  'ATENÇÃO! Não foi possível chamar o paciente'),
            );
            return Right(form);
          case Right():
            return Right(form);
        }
    }
  }
}
