import 'package:crypto_profit_calculator/domain/usecases/check_night_mode_on_start.dart';
import 'package:crypto_profit_calculator/domain/usecases/toggle_night_mode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NightModeCubit extends Cubit<bool> {
  final ICheckNightModeOnStart checkNightModeOnStart;
  final IToggleNightMode toggleNightMode;

  NightModeCubit(this.checkNightModeOnStart, this.toggleNightMode)
      : super(false);

  Future<void> checkNightModeStateOnStart() async {
    final isOn = await checkNightModeOnStart.isNightModeOn();
    emit(isOn);
  }

  Future<void> toggle(bool status) async {
    emit(await toggleNightMode.toggle(status));
  }
}
