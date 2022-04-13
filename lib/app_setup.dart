import 'package:crypto_profit_calculator/bloc_layer.dart';
import 'package:crypto_profit_calculator/data/datasource/local/file_datasource.dart';
import 'package:flutter/material.dart';
import 'package:crypto_profit_calculator/data/repository/datasource_repository.dart';
import 'package:crypto_profit_calculator/domain/repositories/crypto_result_repository.dart';
import 'package:crypto_profit_calculator/domain/usecases/remove_crypto_record.dart';
import 'package:crypto_profit_calculator/domain/usecases/retrieve_history.dart';
import 'package:crypto_profit_calculator/domain/usecases/save_crypro_record.dart';
import 'package:crypto_profit_calculator/presentation/bloc/counter_cubit.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_calculator_cubit.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_cubit.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_history_cubit.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_result_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

class AppSetup {
  final Widget child;

  AppSetup(this.child);

  // repositories
  late DataSourceRepository dataSourceRepository;
  late ICryptoResultRepository cryptoResultRepository;

  // usecases
  late ISaveCryptoRecord saveCryptoRecordUseCase;
  late IRemoveCryptoRecord removeCryptoRecordUseCase;
  late IRetrieveHistory retrieveHistoryUseCase;

  // cubits
  late CryptoCubit cryptoCubit;
  late CryptoResultCubit cryptoResultCubit;
  late CryptoCalculatorCubit cryptoCalculatorCubit;
  late CryptoHistoryCubit cryptoHistoryCubit;
  late CounterCubit counterCubit;

  Future<void> _setupRepositories() async {
    final fileDirectory = await getApplicationDocumentsDirectory();
    dataSourceRepository = FileDataSource(fileDirectory.path);
    cryptoResultRepository = CryptoResultRepository(dataSourceRepository);
  }

  Future<void> _setupBlocs() async {
    cryptoResultCubit = CryptoResultCubit(
      saveCryptoRecordUseCase,
      removeCryptoRecordUseCase,
      retrieveHistoryUseCase,
    );

    counterCubit = CounterCubit();

    cryptoCalculatorCubit = CryptoCalculatorCubit();
    cryptoCubit = CryptoCubit();
    cryptoHistoryCubit = CryptoHistoryCubit(
      retrieveHistoryUseCase,
      saveCryptoRecordUseCase,
      removeCryptoRecordUseCase,
    );
  }

  Future<void> _setupUseCases() async {
    saveCryptoRecordUseCase = SaveCryptoRecord(cryptoResultRepository);
    removeCryptoRecordUseCase = RemoveCryptoRecord(cryptoResultRepository);
    retrieveHistoryUseCase = RetrieveHistoryUseCase(cryptoResultRepository);
  }

  Future<void> setupApp() async {
    await _setupRepositories();
    await _setupUseCases();
    await _setupBlocs();
  }

  Widget buildApp() => BlocLayer(
        child: child,
        providers: [
          BlocProvider<CryptoResultCubit>(
              lazy: false,
              create: (context) => cryptoResultCubit..retrieveHistory()),
          BlocProvider<CryptoCalculatorCubit>(
              lazy: false, create: (context) => cryptoCalculatorCubit),
          BlocProvider<CryptoCubit>(
              lazy: false, create: (context) => cryptoCubit),
          BlocProvider<CryptoHistoryCubit>(
              lazy: false, create: (context) => cryptoHistoryCubit),
          BlocProvider<CounterCubit>(
            create: (context) => counterCubit,
          ),
        ],
      );
}
