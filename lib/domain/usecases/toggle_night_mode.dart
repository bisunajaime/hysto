import 'package:crypto_profit_calculator/domain/repositories/night_mode_repository.dart';

abstract class IToggleNightMode {
  Future<bool> toggle(bool status);
}

class ToggleNightModeImpl implements IToggleNightMode {
  final INightModeRepository nightModeRepository;

  ToggleNightModeImpl(this.nightModeRepository);

  @override
  Future<bool> toggle(bool status) async {
    if (status == true) return await nightModeRepository.turnOnNightMode();
    return await nightModeRepository.turnOffNightMode();
  }
}
