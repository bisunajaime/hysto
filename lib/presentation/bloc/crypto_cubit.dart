import 'package:bloc/bloc.dart';
import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/domain/usecases/calculate_crypto_result.dart';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

class CryptoCubit extends Cubit<CryptoResultEntity> {
  final amountBoughtController = TextEditingController();
  final boughtAtPriceController = TextEditingController();
  final sellPriceController = TextEditingController();
  CryptoCubit() : super(CryptoResultEntity()..id = Uuid().v1()) {
    addListeners();
  }

  String get currentId => state.id!;
  bool isEditingRecord(String id) => id == state.id;

  final calculator = CalculateCryptoResult();

  void clear() {
    reset();
    emit(CryptoResultEntity()
      ..id = Uuid().v1()
      ..dateAdded = DateTime.now()
      ..dateUpdated = DateTime.now());
  }

  void reset() {
    amountBoughtController.clear();
    boughtAtPriceController.clear();
    sellPriceController.clear();
    final newEntity = CryptoResultEntity.reset(Uuid().v1());
    emit(newEntity);
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

  void addListeners() {
    amountBoughtController.addListener(() {
      _onTextFieldChanged(amountBoughtController, (amount) {
        updateEntity(state.copyWith(amountBought: amount));
      });
    });
    boughtAtPriceController.addListener(() {
      _onTextFieldChanged(boughtAtPriceController, (amount) {
        updateEntity(state.copyWith(boughtAtPrice: amount));
      });
    });
    sellPriceController.addListener(() {
      _onTextFieldChanged(sellPriceController, (amount) {
        updateEntity(state.copyWith(sellPrice: amount));
      });
    });
  }

  void _onTextFieldChanged(
      TextEditingController controller, Function(double?) onChanged) {
    if (controller.text.isEmpty) {
      onChanged(null);
      return;
    }
    final value = double.parse(controller.text);
    onChanged(value);
  }

  void closeTextControllers() {
    amountBoughtController.dispose();
    boughtAtPriceController.dispose();
    sellPriceController.dispose();
  }

  bool get canSaveRecord =>
      amountBoughtController.text.isNotEmpty &&
      boughtAtPriceController.text.isNotEmpty &&
      sellPriceController.text.isNotEmpty;

  @override
  Future<void> close() {
    closeTextControllers();
    return super.close();
  }
}
