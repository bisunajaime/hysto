import 'package:crypto_profit_calculator/data/repository/datasource_repository.dart';

class FakeDataSourceRepository implements DataSourceRepository {
  @override
  Future<bool> delete(String fileName) async {
    return true;
  }

  @override
  Future<String?> retrieve(String fileName) async {
    return '';
  }

  @override
  Future<bool> save(String fileName, String jDoc) async {
    return true;
  }
}
