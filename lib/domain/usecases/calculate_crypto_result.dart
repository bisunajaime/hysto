import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';

abstract class ICalculateCryptoResult {
  double calculateShares();
  double calculateProfit();
}

class CalculateCryptoResult implements ICalculateCryptoResult {
  final CryptoResultEntity entity;

  CalculateCryptoResult(this.entity);

  @override
  double calculateProfit() {
    return calculateShares() * entity.sellPrice;
  }

  @override
  double calculateShares() {
    return entity.amountBought * entity.boughtAtPrice;
  }
}
