import 'package:crypto_profit_calculator/data/models/crypto_result_model.dart';
import 'package:crypto_profit_calculator/data/repository/datasource_repository.dart';
import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/domain/repositories/crypto_result_repository.dart';

abstract class IRetrieveHistory {
  Future<Map<String, CryptoResultEntity>> retrieveHistory();
}

class RetrieveHistoryUseCase implements IRetrieveHistory {
  final ICryptoResultRepository cryptoResultRepository;

  RetrieveHistoryUseCase(this.cryptoResultRepository);

  @override
  Future<Map<String, CryptoResultEntity>> retrieveHistory() async {
    return await cryptoResultRepository.retrieveHistory();
  }
}
