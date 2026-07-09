import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  late FlutterSecureStorage _secureStorage;

  Future<String?> loadSessionId() async {
    _secureStorage = FlutterSecureStorage();
    String? sessionId = await _secureStorage.read(key: "sessionId");
    return sessionId;
  }

  void setSessionId(String id) => _secureStorage.write(key: "sessionId", value: id);

  void removeSessionId() => _secureStorage.delete(key: "sessionId");
}
