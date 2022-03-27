import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/domain/usecases/remove_crypto_record.dart';
import 'package:crypto_profit_calculator/domain/usecases/retrieve_history.dart';
import 'package:crypto_profit_calculator/domain/usecases/save_crypro_record.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoResultCubit extends Cubit<Map<String, CryptoResultEntity>> {
  final ISaveCryptoRecord saveCryptoRecordUseCase;
  final IRemoveCryptoRecord removeCryptoRecordUseCase;
  final IRetrieveHistory retrieveHistoryUseCase;
  CryptoResultCubit(
    this.saveCryptoRecordUseCase,
    this.removeCryptoRecordUseCase,
    this.retrieveHistoryUseCase,
  ) : super({});

  List<String> get keys => state.keys.toList();

  Future<void> retrieveHistory() async {
    final result = await retrieveHistoryUseCase.retrieveHistory();
    state.clear();
    state.addAll(result);
    emit(state);
  }

  Future<void> saveEntity(CryptoResultEntity entity) async {
    state[entity.id!] = entity;
    await saveCryptoRecordUseCase.saveRecord(state);
    emit(state);
  }

  Future<void> removeEntity(CryptoResultEntity entity) async {
    state.remove(entity);
    await removeCryptoRecordUseCase.removeRecord(entity);
    emit(state);
  }

  Future<void> clearResults() async {
    state.clear();
    emit(state);
    // await repository.clearResults
  }
}

abstract class CryptoResultState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CryptoResultInitial extends CryptoResultState {}

class CryptoResultsLoading extends CryptoResultState {}

class CryptoResultUpdated extends CryptoResultState {
  final CryptoResultEntity entity;

  CryptoResultUpdated(this.entity);
}

class CryptoResultSaved extends CryptoResultState {
  final bool didSave;

  CryptoResultSaved(this.didSave);
}

class RetrievedCryptoResults extends CryptoResultState {
  final Map<String, CryptoResultEntity> results;

  RetrievedCryptoResults(this.results);
}

class CryptoResultRemoved extends CryptoResultState {
  final bool removed;

  CryptoResultRemoved(this.removed);
}
