import 'dart:io';

import 'package:crypto_profit_calculator/data/repository/datasource_repository.dart';

class FileDataSource implements DataSourceRepository {
  final String filePath;

  FileDataSource(this.filePath);

  @override
  Future<bool> delete(String fileName) async {
    try {
      final fileToDelete = File('$filePath/$fileName');
      if (await fileToDelete.exists()) {
        final didDelete = await fileToDelete.delete();
        return await didDelete.exists();
      }
      return false;
    } on Exception catch (e) {
      return false;
    }
  }

  @override
  Future<String?> retrieve(String fileName) async {
    try {
      final file = File('$filePath/$fileName');
      if (await file.exists()) {
        return await file.readAsString();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> save(String fileName, String jDoc) async {
    try {
      final file = File('$filePath/$fileName');
      await file.writeAsString(jDoc);
      return true;
    } catch (e) {
      return false;
    }
  }
}
