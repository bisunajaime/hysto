import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_profit_calculator/data/repository/datasource_repository.dart';
import 'package:crypto_profit_calculator/domain/repositories/crypto_result_repository.dart';
import 'package:crypto_profit_calculator/domain/usecases/remove_crypto_record.dart';
import 'package:crypto_profit_calculator/domain/usecases/retrieve_history.dart';
import 'package:crypto_profit_calculator/domain/usecases/save_crypro_record.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_result_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/fake_datasource_repository.dart';

void main() {
  // data source
  late DataSourceRepository dataSource;

  // repos
  late ICryptoResultRepository cryptoResultRepository;

  // usecases
  late ISaveCryptoRecord saveCryptoRecordUseCase;
  late IRemoveCryptoRecord removeCryptoRecordUseCase;
  late IRetrieveHistory retrieveHistoryUseCase;

  // cubit
  late CryptoResultCubit cryptoResultCubit;

  setUp(() {
    dataSource = FakeDataSourceRepository();
    cryptoResultRepository = CryptoResultRepository(dataSource);
    saveCryptoRecordUseCase = SaveCryptoRecord(cryptoResultRepository);
    removeCryptoRecordUseCase = RemoveCryptoRecord(cryptoResultRepository);
    retrieveHistoryUseCase = RetrieveHistoryUseCase(cryptoResultRepository);
    cryptoResultCubit = CryptoResultCubit(
      saveCryptoRecordUseCase,
      removeCryptoRecordUseCase,
      retrieveHistoryUseCase,
    );
  });

  test('adding a crypto result', () async {
    // setup

    // test
    whenListen(cryptoResultCubit, cryptoResultCubit.stream,
        initialState: CryptoResultInitial());
    expect(cryptoResultCubit.state, CryptoResultInitial());

    await cryptoResultCubit.retrieveHistory();
    await expectLater(
        cryptoResultCubit.stream,
        emitsInOrder([
          CryptoResultInitial(),
          CryptoResultUpdated({}),
        ]));
    expect(cryptoResultCubit.state, CryptoResultUpdated({}));
  });
}
