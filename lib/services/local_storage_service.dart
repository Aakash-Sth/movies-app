import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  late SharedPreferences _prefs;

  Future<String?> loadSessionId() async {
    _prefs = await SharedPreferences.getInstance();
    String? sessionId = _prefs.getString("sessionId");
    return sessionId;
  }

  void setSessionId(String id) => _prefs.setString("sessionId", id);

  void removeSessionId() => _prefs.remove("sessionId");
}
