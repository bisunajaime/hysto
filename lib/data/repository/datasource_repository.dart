abstract class DataSourceRepository {
  Future<bool> save(String jDoc);

  // when retrieving have something to check if the file is present
  // if file is not present in case the app is loaded the first time
  // create an empty jdoc and save it
  Future<String?> retrieve(String fileName);
  Future<bool> delete(String fileName);
}
