import 'package:crypto_profit_calculator/data/datasource/local/file_datasource.dart';
import 'package:crypto_profit_calculator/data/repository/datasource_repository.dart';
import 'package:crypto_profit_calculator/domain/repositories/crypto_result_repository.dart';
import 'package:crypto_profit_calculator/domain/usecases/remove_crypto_record.dart';
import 'package:crypto_profit_calculator/domain/usecases/retrieve_history.dart';
import 'package:crypto_profit_calculator/domain/usecases/save_crypro_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocLayer extends StatefulWidget {
  final Widget child;
  const BlocLayer({Key? key, required this.child}) : super(key: key);

  @override
  State<BlocLayer> createState() => _BlocLayerState();
}

class _BlocLayerState extends State<BlocLayer> {
  late DataSourceRepository dataSourceRepository;
  late ICryptoResultRepository cryptoResultRepository;

  late ISaveCryptoRecord saveCryptoRecordUseCase;
  late IRemoveCryptoRecord removeCryptoRecordUseCase;
  late IRetrieveHistory retrieveHistoryUseCase;

  @override
  void initState() {
    super.initState();

    dataSourceRepository = FileDataSource();
    cryptoResultRepository = CryptoResultRepository(dataSourceRepository);

    saveCryptoRecordUseCase = SaveCryptoRecord(cryptoResultRepository);
    removeCryptoRecordUseCase = RemoveCryptoRecord(cryptoResultRepository);
    retrieveHistoryUseCase = RetrieveHistoryUseCase(cryptoResultRepository);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: widget.child,
    );
  }
}
