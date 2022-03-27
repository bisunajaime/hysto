import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';

abstract class ICalculateCryptoResult {
  double? calculateShares(CryptoResultEntity entity);
  double? calculateProfit(CryptoResultEntity entity);
}

class CalculateCryptoResult implements ICalculateCryptoResult {
  @override
  double? calculateProfit(CryptoResultEntity entity) {
    if (!entity.canCalculateProfit) return null;
    return calculateShares(entity)! * entity.sellPrice!;
  }

  @override
  double? calculateShares(CryptoResultEntity entity) {
    if (!entity.canCalculateShares) return null;
    return entity.amountBought! * entity.boughtAtPrice!;
  }
}

class OtherWayOfCalculatingCryptoProfits implements ICalculateCryptoResult {
  @override
  double? calculateProfit(CryptoResultEntity entity) {
    // TODO: implement calculateProfit
    throw UnimplementedError();
  }

  @override
  double? calculateShares(CryptoResultEntity entity) {
    // TODO: implement calculateShares
    throw UnimplementedError();
  }
}
