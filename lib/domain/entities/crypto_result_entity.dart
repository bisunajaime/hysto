import 'package:crypto_profit_calculator/data/models/crypto_result_model.dart';
import 'package:equatable/equatable.dart';

class CryptoResultEntity extends Equatable {
  String? id;
  double? amountBought;
  double? boughtAtPrice;
  double? sellPrice;
  double? shares;
  double? profit;
  DateTime? dateAdded;
  DateTime? dateUpdated;

  CryptoResultEntity();

  bool get canCalculateShares => amountBought != null && boughtAtPrice != null;
  bool get canCalculateProfit => canCalculateShares && sellPrice != null;
  bool get didProfit => profit != null && profit! > 0;

  CryptoResultModel toModel() => CryptoResultModel(
        id!,
        amountBought!,
        boughtAtPrice!,
        sellPrice!,
        shares!,
        profit!,
        dateAdded!,
        dateUpdated,
      );

  CryptoResultEntity copyWith({
    String? id,
    double? amountBought,
    double? boughtAtPrice,
    double? sellPrice,
    double? shares,
    double? profit,
    DateTime? dateAdded,
    DateTime? dateUpdated,
  }) {
    return CryptoResultEntity()
      ..id = id ?? this.id
      ..amountBought = amountBought ?? this.amountBought
      ..boughtAtPrice = boughtAtPrice ?? this.boughtAtPrice
      ..sellPrice = sellPrice ?? this.sellPrice
      ..shares = shares ?? this.shares
      ..profit = profit ?? this.profit
      ..dateAdded = dateAdded ?? this.dateAdded
      ..dateUpdated = dateUpdated ?? this.dateUpdated;
  }

  CryptoResultEntity.reset(String? uuid)
      : id = uuid,
        amountBought = null,
        boughtAtPrice = null,
        sellPrice = null,
        shares = null,
        profit = null,
        dateAdded = DateTime.now(),
        dateUpdated = DateTime.now();

  void reset() {
    amountBought = null;
    boughtAtPrice = null;
    sellPrice = null;
    shares = null;
    profit = null;
  }

  @override
  List<Object?> get props => [
        id,
        amountBought,
        boughtAtPrice,
        sellPrice,
        shares,
        profit,
        dateAdded,
        dateUpdated,
      ];
}
