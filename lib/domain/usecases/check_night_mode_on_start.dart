import 'package:crypto_profit_calculator/domain/repositories/night_mode_repository.dart';

abstract class ICheckNightModeOnStart {
  Future<bool> isNightModeOn();
}

class CheckNightModeOnStart implements ICheckNightModeOnStart {
  final INightModeRepository nightModeRepository;

  CheckNightModeOnStart(this.nightModeRepository);
  @override
  Future<bool> isNightModeOn() async {
    return await nightModeRepository.checkStatus();
  }
}
