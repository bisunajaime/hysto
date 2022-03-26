import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/domain/usecases/remove_crypto_record.dart';
import 'package:crypto_profit_calculator/domain/usecases/retrieve_history.dart';
import 'package:crypto_profit_calculator/domain/usecases/save_crypro_record.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoResultCubit extends Cubit<CryptoResultState> {
  final ISaveCryptoRecord saveCryptoRecordUseCase;
  final IRemoveCryptoRecord removeCryptoRecordUseCase;
  final IRetrieveHistory retrieveHistoryUseCase;
  CryptoResultCubit(
    this.saveCryptoRecordUseCase,
    this.removeCryptoRecordUseCase,
    this.retrieveHistoryUseCase,
  ) : super(CryptoResultInitial());

  final results = <String, CryptoResultEntity>{};

  Future<void> retrieveHistory() async {
    final result = await retrieveHistoryUseCase.retrieveHistory();
    emit(RetrievedCryptoResults(result));
  }

  Future<void> saveEntity(CryptoResultEntity entity) async {
    emit(CryptoResultSaved(await saveCryptoRecordUseCase.saveRecord(entity)));
  }

  Future<void> removeEntity(CryptoResultEntity entity) async {
    CryptoResultRemoved(await removeCryptoRecordUseCase.removeRecord(entity));
  }
}

abstract class CryptoResultState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CryptoResultInitial extends CryptoResultState {}

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
