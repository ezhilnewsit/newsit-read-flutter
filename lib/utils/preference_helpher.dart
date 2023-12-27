import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'contants.dart';

class PreferenceHelper {
    static const FlutterSecureStorage storage = FlutterSecureStorage();

      static Future<bool> getLoginDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Constants.getTrack) ?? false;
  }

    static setBearer(String? value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (value is String) {
        await prefs.setString(SharedPrefKeys.bearerToken, value);
      }
    }

    static Future<String> getBearer() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(SharedPrefKeys.bearerToken) ?? '';
    }


}

clearPreference() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
