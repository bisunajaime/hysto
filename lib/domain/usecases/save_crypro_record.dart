import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/domain/repositories/crypto_result_repository.dart';

abstract class ISaveCryptoRecord {
  Future<bool> saveRecord(Map<String, CryptoResultEntity> entities);
}

class SaveCryptoRecord implements ISaveCryptoRecord {
  final ICryptoResultRepository cryptoResultRepository;

  SaveCryptoRecord(this.cryptoResultRepository);
  @override
  Future<bool> saveRecord(Map<String, CryptoResultEntity> entities) async {
    return await cryptoResultRepository.saveRecords(entities);
  }
}
