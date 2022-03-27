import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/domain/usecases/calculate_crypto_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoCalculatorCubit extends Cubit<double?> {
  CryptoCalculatorCubit() : super(null);

  void calculateProfit(CryptoResultEntity entity) {
    if (!entity.canCalculateProfit) return;
    ICalculateCryptoResult calculator = CalculateCryptoResult();
    emit(calculator.calculateProfit(entity));
  }

  void calculateShares(CryptoResultEntity entity) {
    if (!entity.canCalculateShares) return;
    ICalculateCryptoResult calculator = CalculateCryptoResult();
    emit(calculator.calculateShares(entity));
  }
}
