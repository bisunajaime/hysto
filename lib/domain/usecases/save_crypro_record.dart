import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/domain/repositories/crypto_result_repository.dart';

abstract class ISaveCryptoRecord {
  Future<bool> saveRecord(CryptoResultEntity entity);
}

class SaveCryptoRecord implements ISaveCryptoRecord {
  final ICryptoResultRepository cryptoResultRepository;

  SaveCryptoRecord(this.cryptoResultRepository);
  @override
  Future<bool> saveRecord(CryptoResultEntity entity) async {
    return await cryptoResultRepository.saveRecord(entity);
  }
}
