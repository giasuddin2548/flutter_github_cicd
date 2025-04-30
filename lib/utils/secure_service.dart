import 'package:shared_preferences/shared_preferences.dart';

class SecureService {
  Future<void> setStringSessionData({
    required String myValue,
    required String myKey,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    // var modified= await DataSecurity().dataToEncrypt(data: myValue);
    await prefs.setString(myKey, myValue);
  }

  Future<String> getStringSessionData(String myKey) async {
    final prefs = await SharedPreferences.getInstance();
    var dd = prefs.getString(myKey) ?? '';
    //var modified= await DataSecurity().encryptToDecrypt(encryptedData: dd);
    return dd;
  }

  Future<bool> getBoolSessionData(String myKey) async {
    final prefs = await getStringSessionData(myKey);

    var ddd = false;

    if (prefs == "true") {
      ddd = true;
    } else {
      ddd = false;
    }
    return ddd;
  }
}
