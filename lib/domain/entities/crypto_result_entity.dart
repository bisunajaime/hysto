import 'package:crypto_profit_calculator/data/models/crypto_result_model.dart';

class CryptoResultEntity {
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

  void reset() {
    amountBought = null;
    boughtAtPrice = null;
    sellPrice = null;
    shares = null;
    profit = null;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CryptoResultEntity &&
        other.id == id &&
        other.amountBought == amountBought &&
        other.boughtAtPrice == boughtAtPrice &&
        other.sellPrice == sellPrice &&
        other.shares == shares &&
        other.profit == profit &&
        other.dateAdded == dateAdded &&
        other.dateUpdated == dateUpdated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        amountBought.hashCode ^
        boughtAtPrice.hashCode ^
        sellPrice.hashCode ^
        shares.hashCode ^
        profit.hashCode ^
        dateAdded.hashCode ^
        dateUpdated.hashCode;
  }
}
