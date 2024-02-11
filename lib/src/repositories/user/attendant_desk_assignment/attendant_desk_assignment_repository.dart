import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';

abstract interface class AttendantDeskAssignmentRepository {
  Future<Either<RepositoryException, Unit>> startService(int deskNumber);
}
