import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:asyncstate/asyncstate.dart' as asyncState;
import 'package:et_lab_clinica_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';

class HomeController with MessageStateMixin {
  HomeController({
    required AttendantDeskAssignmentRepository
        attendantDeskAssignmentRepository,
  }) : _attendantDeskAssignmentRepository = attendantDeskAssignmentRepository;

  final AttendantDeskAssignmentRepository _attendantDeskAssignmentRepository;

  Future<void> startService(int deskNumber) async {
    asyncState.AsyncState.show();
    final result =
        await _attendantDeskAssignmentRepository.startService(deskNumber);

    switch (result) {
      case Left():
        asyncState.AsyncState.hide();
        showError('Erro ao iniciar Guichê');
      case Right():
        asyncState.AsyncState.hide();
        //Chamar prox paciente;
        showInfo('Registrou com sucesso');
    }
  }
}
