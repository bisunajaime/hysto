import 'package:crypto_profit_calculator/data/models/crypto_result_model.dart';

class CryptoResultEntity {
  final String id;
  final double amountBought;
  final double boughtAtPrice;
  final double sellPrice;
  final double shares;
  final double profit;

  CryptoResultEntity(
    this.id,
    this.amountBought,
    this.boughtAtPrice,
    this.sellPrice,
    this.shares,
    this.profit,
  );

  CryptoResultModel toModel() => CryptoResultModel(
        id,
        amountBought,
        boughtAtPrice,
        sellPrice,
        shares,
        profit,
      );
}
