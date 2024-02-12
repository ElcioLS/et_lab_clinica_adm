import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';

import 'painel_repository.dart';

class PainelRepositoryImpl implements PainelRepository {
  PainelRepositoryImpl({
    required this.restClient,
  });

  final RestClient restClient;

  @override
  Future<Either<RepositoryException, String>> callOnPainel(
      String password, int attendantDesk) async {
    try {
      final Response(data: {'id': id}) =
          await restClient.auth.post('/painelCheckin', data: {
        'password': password,
        'time_called': DateTime.now().toIso8601String(),
        'attendant_desk': attendantDesk,
      });

      return Right(id);
    } on DioException catch (e, s) {
      log('Erro ao chamar paciente no painel', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}
