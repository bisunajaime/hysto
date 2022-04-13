import 'package:bloc/bloc.dart';
import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/domain/usecases/remove_crypto_record.dart';
import 'package:crypto_profit_calculator/domain/usecases/retrieve_history.dart';
import 'package:crypto_profit_calculator/domain/usecases/save_crypro_record.dart';

class CryptoHistoryCubit extends Cubit<Map<String, CryptoResultEntity>> {
  final IRetrieveHistory retrieveHistoryUseCase;
  final ISaveCryptoRecord saveCryptoRecordUseCase;
  final IRemoveCryptoRecord removeCryptoRecordUseCase;
  CryptoHistoryCubit(this.retrieveHistoryUseCase, this.saveCryptoRecordUseCase,
      this.removeCryptoRecordUseCase)
      : super({});

  Future<void> loadHistory() async =>
      emit(await retrieveHistoryUseCase.retrieveHistory());

  Future<bool> insertRecord(CryptoResultEntity entity) async {
    state[entity.id!] = entity;
    return await saveCryptoRecordUseCase.saveRecord(state);
  }

  Future<bool> removeRecord(CryptoResultEntity entity) async {
    state.removeWhere((key, value) => key == entity.id);
    emit(state);
    return await removeCryptoRecordUseCase.removeRecord(entity);
  }
}
