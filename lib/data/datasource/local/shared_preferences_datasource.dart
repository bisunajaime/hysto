import 'package:crypto_profit_calculator/data/repository/datasource_repository.dart';

abstract class ISharedPreferenceDataSource extends DataSourceRepository {
  Future<dynamic> retrieveKey(String key);
}

class SharedPreferencesDataSource implements ISharedPreferenceDataSource {
  @override
  Future<bool> delete(String fileName) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<String?> retrieve(String fileName) {
    // TODO: implement retrieve
    throw UnimplementedError();
  }

  @override
  Future<bool> save(String fileName, String jDoc) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future retrieveKey(String key) {
    // TODO: implement retrieveKey
    throw UnimplementedError();
  }
}
