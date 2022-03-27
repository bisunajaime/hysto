import 'dart:convert';

import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';

class CryptoResultModel {
  final String id;
  final double amountBought;
  final double boughtAtPrice;
  final double sellPrice;
  final double shares;
  final double profit;
  final DateTime dateAdded;
  final DateTime? dateUpdated;

  CryptoResultModel(
    this.id,
    this.amountBought,
    this.boughtAtPrice,
    this.sellPrice,
    this.shares,
    this.profit,
    this.dateAdded,
    this.dateUpdated,
  );

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'amountBought': amountBought,
        'boughtAtPrice': boughtAtPrice,
        'sellPrice': sellPrice,
        'shares': shares,
        'profit': profit,
        'dateAdded': dateAdded.millisecondsSinceEpoch,
        'dateUpdated': dateUpdated?.millisecondsSinceEpoch,
      };

  CryptoResultModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        amountBought = json['amountBought'],
        boughtAtPrice = json['boughtAtPrice'],
        sellPrice = json['sellPrice'],
        shares = json['shares'],
        profit = json['profit'],
        dateAdded = DateTime.fromMillisecondsSinceEpoch(json['dateAdded']),
        dateUpdated = DateTime.fromMillisecondsSinceEpoch(json['dateUpdated']);

  CryptoResultModel.fromEntity(CryptoResultEntity entity)
      : id = entity.id!,
        amountBought = entity.amountBought!,
        boughtAtPrice = entity.boughtAtPrice!,
        sellPrice = entity.sellPrice!,
        shares = entity.shares!,
        profit = entity.profit!,
        dateAdded = entity.dateAdded!,
        dateUpdated = entity.dateUpdated;

  CryptoResultEntity toEntity() {
    return CryptoResultEntity()
      ..id = id
      ..amountBought = amountBought
      ..boughtAtPrice = boughtAtPrice
      ..sellPrice = sellPrice
      ..shares = shares
      ..profit = profit
      ..dateAdded = dateAdded
      ..dateUpdated = dateUpdated;
  }

  CryptoResultModel copyWith({
    String? id,
    double? amountBought,
    double? boughtAtPrice,
    double? sellPrice,
    double? shares,
    double? profit,
    DateTime? dateAdded,
    DateTime? dateUpdated,
  }) {
    return CryptoResultModel(
      id ?? this.id,
      amountBought ?? this.amountBought,
      boughtAtPrice ?? this.boughtAtPrice,
      sellPrice ?? this.sellPrice,
      shares ?? this.shares,
      profit ?? this.profit,
      dateAdded ?? this.dateAdded,
      dateUpdated ?? this.dateUpdated,
    );
  }
}
