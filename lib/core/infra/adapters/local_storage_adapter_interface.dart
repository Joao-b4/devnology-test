abstract class ILocalStorageAdapter{
  Future<void> connect();
  Future get(String collectionName, String key);
  Future getAll(String collectionName);
  Future put(String collectionName, String key, dynamic value);
  Future delete(String collectionName, String key);
}

