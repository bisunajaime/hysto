import 'package:crypto_profit_calculator/data/models/crypto_result_model.dart';
import 'package:crypto_profit_calculator/data/repository/datasource_repository.dart';

abstract class IRetrieveHistory {
  Future<List<CryptoResultModel>> retrieveHistory();
}

class RetrieveHistoryUseCase implements IRetrieveHistory {
  final DataSourceRepository dataSourceRepository;

  RetrieveHistoryUseCase(this.dataSourceRepository);

  @override
  Future<List<CryptoResultModel>> retrieveHistory() {
    // TODO: implement retrieveHistory
    throw UnimplementedError();
  }
}
