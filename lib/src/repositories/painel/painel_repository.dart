import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';

abstract interface class PainelRepository {
  Future<Either<RepositoryException, String>> callOnPainel(
      String password, int attendantDesk);
}
