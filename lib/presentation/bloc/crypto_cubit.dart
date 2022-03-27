import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/domain/usecases/calculate_crypto_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class CryptoCubit extends Cubit<CryptoResultEntity> {
  final amountBoughtController = TextEditingController();
  final boughtAtPriceController = TextEditingController();
  final sellPriceController = TextEditingController();
  CryptoCubit()
      : super(CryptoResultEntity()
          ..id = Uuid().v1()
          ..dateAdded = DateTime.now()
          ..dateUpdated = DateTime.now());

  final calculator = CalculateCryptoResult();

  void clear() {
    reset();
    emit(CryptoResultEntity()
      ..id = Uuid().v1()
      ..dateAdded = DateTime.now()
      ..dateUpdated = DateTime.now());
  }

  void reset() {
    state.reset();
    amountBoughtController.clear();
    boughtAtPriceController.clear();
    sellPriceController.clear();
    emit(state);
  }

  void setEntity(CryptoResultEntity entity) {
    amountBoughtController.text = entity.amountBought.toString();
    boughtAtPriceController.text = entity.boughtAtPrice.toString();
    sellPriceController.text = entity.sellPrice.toString();
    emit(entity);
  }

  void updateEntity(CryptoResultEntity entity) {
    emit(entity.copyWith(
      shares: calculator.calculateShares(entity),
      profit: calculator.calculateProfit(entity),
    ));
  }
}
