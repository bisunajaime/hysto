import 'package:crypto_profit_calculator/bloc_layer.dart';
import 'package:crypto_profit_calculator/data/datasource/local/file_datasource.dart';
import 'package:crypto_profit_calculator/data/repository/datasource_repository.dart';
import 'package:crypto_profit_calculator/domain/repositories/crypto_result_repository.dart';
import 'package:crypto_profit_calculator/domain/usecases/remove_crypto_record.dart';
import 'package:crypto_profit_calculator/domain/usecases/retrieve_history.dart';
import 'package:crypto_profit_calculator/domain/usecases/save_crypro_record.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_calculator_cubit.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_cubit.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_result_cubit.dart';
import 'package:crypto_profit_calculator/presentation/pages/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final fileDirectory = await getApplicationDocumentsDirectory();

  // repositories
  late DataSourceRepository dataSourceRepository;
  late ICryptoResultRepository cryptoResultRepository;
  dataSourceRepository = FileDataSource(fileDirectory.path);
  cryptoResultRepository = CryptoResultRepository(dataSourceRepository);

  // usecases
  late ISaveCryptoRecord saveCryptoRecordUseCase;
  late IRemoveCryptoRecord removeCryptoRecordUseCase;
  late IRetrieveHistory retrieveHistoryUseCase;
  saveCryptoRecordUseCase = SaveCryptoRecord(cryptoResultRepository);
  removeCryptoRecordUseCase = RemoveCryptoRecord(cryptoResultRepository);
  retrieveHistoryUseCase = RetrieveHistoryUseCase(cryptoResultRepository);

  // cubits
  late CryptoCubit cryptoCubit;
  late CryptoResultCubit cryptoResultCubit;
  late CryptoCalculatorCubit cryptoCalculatorCubit;
  cryptoResultCubit = CryptoResultCubit(
    saveCryptoRecordUseCase,
    removeCryptoRecordUseCase,
    retrieveHistoryUseCase,
  );

  cryptoCalculatorCubit = CryptoCalculatorCubit();
  cryptoCubit = CryptoCubit();

  runApp(BlocLayer(
    providers: [
      BlocProvider<CryptoResultCubit>(
          lazy: false,
          create: (context) => cryptoResultCubit..retrieveHistory()),
      BlocProvider<CryptoCalculatorCubit>(
          lazy: false, create: (context) => cryptoCalculatorCubit),
      BlocProvider<CryptoCubit>(lazy: false, create: (context) => cryptoCubit),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: CalculatorPage(),
    );
  }
}
