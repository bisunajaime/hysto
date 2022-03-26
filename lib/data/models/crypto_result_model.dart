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
        'dateAdded': dateAdded.toIso8601String(),
        'dateUpdated': dateUpdated?.toIso8601String(),
      };

  CryptoResultModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        amountBought = json['amountBought'],
        boughtAtPrice = json['boughtAtPrice'],
        sellPrice = json['sellPrice'],
        shares = json['shares'],
        profit = json['profit'],
        dateAdded = DateTime.parse(json['dateAdded']),
        dateUpdated = DateTime.parse(json['dateUpdated']);

  CryptoResultModel.fromEntity(CryptoResultEntity entity)
      : id = entity.id,
        amountBought = entity.amountBought,
        boughtAtPrice = entity.boughtAtPrice,
        sellPrice = entity.sellPrice,
        shares = entity.shares,
        profit = entity.profit,
        dateAdded = entity.dateAdded,
        dateUpdated = entity.dateUpdated;

  CryptoResultEntity toEntity() => CryptoResultEntity(
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
