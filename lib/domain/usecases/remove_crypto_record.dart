import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/domain/repositories/crypto_result_repository.dart';

abstract class IRemoveCryptoRecord {
  Future<bool> removeRecord(CryptoResultEntity entity);
}

class RemoveCryptoRecord implements IRemoveCryptoRecord {
  final ICryptoResultRepository cryptoResultRepository;

  RemoveCryptoRecord(this.cryptoResultRepository);

  @override
  Future<bool> removeRecord(CryptoResultEntity entity) async {
    final cryptoItems = await cryptoResultRepository.retrieveHistory();
    cryptoItems.remove(entity.id);
    final didSave = await cryptoResultRepository.saveRecords(cryptoItems);
    return didSave;
  }
}
