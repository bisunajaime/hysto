import 'package:crypto_profit_calculator/data/models/crypto_result_model.dart';

class CryptoResultEntity {
  final String id;
  final double amountBought;
  final double boughtAtPrice;
  final double sellPrice;
  final double shares;
  final double profit;
  final DateTime dateAdded;
  final DateTime? dateUpdated;

  CryptoResultEntity(
    this.id,
    this.amountBought,
    this.boughtAtPrice,
    this.sellPrice,
    this.shares,
    this.profit,
    this.dateAdded,
    this.dateUpdated,
  );

  CryptoResultModel toModel() => CryptoResultModel(
        id,
        amountBought,
        boughtAtPrice,
        sellPrice,
        shares,
        profit,
        dateAdded,
        dateUpdated,
      );
}
