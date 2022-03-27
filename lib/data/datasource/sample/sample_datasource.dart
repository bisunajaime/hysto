import 'package:crypto_profit_calculator/data/repository/datasource_repository.dart';

class SampleDataSource implements DataSourceRepository {
  @override
  Future<bool> delete(String fileName) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<String?> retrieve(String fileName) async {
    return '';
  }

  @override
  Future<bool> save(String fileName, String jDoc) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
