import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/domain/usecases/remove_crypto_record.dart';
import 'package:crypto_profit_calculator/domain/usecases/retrieve_history.dart';
import 'package:crypto_profit_calculator/domain/usecases/save_crypro_record.dart';

class CryptoResultCubit extends Cubit<CryptoResultState> {
  final ISaveCryptoRecord saveCryptoRecordUseCase;
  final IRemoveCryptoRecord removeCryptoRecordUseCase;
  final IRetrieveHistory retrieveHistoryUseCase;
  CryptoResultCubit(
    this.saveCryptoRecordUseCase,
    this.removeCryptoRecordUseCase,
    this.retrieveHistoryUseCase,
  ) : super(CryptoResultInitial());

  final Map<String, CryptoResultEntity> history = {};
  List<String> get keys => history.keys.toList();

  Future<void> retrieveHistory() async {
    emit(CryptoResultsLoading());
    final result = await retrieveHistoryUseCase.retrieveHistory();
    history.clear();
    history.addAll(result);
    emit(CryptoResultUpdated(history));
  }

  Future<void> saveEntity(CryptoResultEntity entity, Function onSave) async {
    emit(CryptoResultsLoading());
    history[entity.id!] = entity;
    await saveCryptoRecordUseCase.saveRecord(history);
    await retrieveHistory();
    onSave();
  }

  Future<void> removeEntity(CryptoResultEntity entity) async {
    emit(CryptoResultsLoading());
    history.remove(entity);
    await removeCryptoRecordUseCase.removeRecord(entity);
    emit(CryptoResultUpdated(history));
  }

  Future<void> clearResults() async {
    emit(CryptoResultsLoading());
    history.clear();
    emit(CryptoResultUpdated(history));
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
  final Map<String, CryptoResultEntity> results;

  CryptoResultUpdated(this.results);
}
