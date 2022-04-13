import 'package:crypto_profit_calculator/data/repository/datasource_repository.dart';

abstract class INightModeRepository {
  Future<bool> turnOnNightMode();
  Future<bool> turnOffNightMode();
  Future<bool> checkStatus();
  String get fileName;
}

class NightModeRepository implements INightModeRepository {
  final DataSourceRepository dataSource;

  NightModeRepository(this.dataSource);

  @override
  Future<bool> turnOffNightMode() async {
    final didSave = await dataSource.save(fileName, 'on');
    return didSave;
  }

  @override
  Future<bool> turnOnNightMode() async {
    return await dataSource.save(fileName, 'off');
  }

  @override
  String get fileName => 'night_mode.json';

  @override
  Future<bool> checkStatus() async {
    final status = await dataSource.retrieve(fileName);
    if (status == null) return false;
    return status == 'on';
  }
}
