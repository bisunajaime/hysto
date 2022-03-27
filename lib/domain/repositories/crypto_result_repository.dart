import 'dart:convert';

import 'package:crypto_profit_calculator/data/models/crypto_result_model.dart';
import 'package:crypto_profit_calculator/data/repository/datasource_repository.dart';
import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';

abstract class ICryptoResultRepository {
  Future<Map<String, CryptoResultEntity>> retrieveHistory();
  Future<bool> saveRecord(CryptoResultEntity entity);
  Future<bool> saveRecords(Map<String, CryptoResultEntity> entities);
  Future<bool> removeRecord(CryptoResultEntity entity);
  String get fileName;
}

class CryptoResultRepository implements ICryptoResultRepository {
  final DataSourceRepository dataSource;

  CryptoResultRepository(this.dataSource);

  @override
  Future<bool> removeRecord(CryptoResultEntity entity) async {
    final records = await dataSource.retrieve(fileName);
    final decode = jsonDecode(records!) as Map<String, dynamic>;
    decode[entity.id!] = entity.toModel().toJson();
    return await dataSource.save(fileName, jsonEncode(decode));
  }

  @override
  Future<Map<String, CryptoResultEntity>> retrieveHistory() async {
    final raw = await dataSource.retrieve(fileName);
    if (raw == null) {
      final create = await dataSource.save(fileName, '{}');
      if (create) {
        return {};
      }
    }
    final results = jsonDecode(raw!) as Map<String, dynamic>;
    final resultMap = <String, CryptoResultEntity>{};
    for (var e in results.keys) {
      resultMap[e] = CryptoResultModel.fromJson(results[e]).toEntity();
    }
    return resultMap;
  }

  @override
  Future<bool> saveRecord(CryptoResultEntity entity) async =>
      await dataSource.save(fileName, entity.toModel().toJson());

  @override
  String get fileName => 'crypto_records.json';

  @override
  Future<bool> saveRecords(Map<String, CryptoResultEntity> entities) async {
    final raw = <String, dynamic>{};
    entities.forEach((key, value) {
      raw[key] = value.toModel().toMap();
    });
    final didSave = await dataSource.save(fileName, jsonEncode(raw));
    return didSave;
  }
}

// const dataFormat = {
//   'uuid:dateinseconds': {
//     'id': 'id',
//     'amountBought': 'amountBought',
//     'boughtAtPrice': 'boughtAtPrice',
//     'sellPrice': 'sellPrice',
//     'shares': 'shares',
//     'profit': 'profit',
//   }
// }
