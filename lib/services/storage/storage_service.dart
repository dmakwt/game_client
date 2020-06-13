abstract class StorageService {

  
  StorageService();

  Future<void> setData(String key, String value);

  String getData(String key);

  Future<void> setToken(String token);

  String getToken();
}
