import 'package:shared_preferences/shared_preferences.dart';

class ShearedprefService {
  static late SharedPreferences shearedPrefs;
  static bool _initialized = false;

  static Future<void> _initialize() async {
    shearedPrefs = await SharedPreferences.getInstance();
  }

  static Future<void> initialize() async {
    if (!_initialized) {
      await _initialize();
      _initialized = true;
    }
  }

  //set  user Logged
  static Future<void> setUserLoggedIn(bool value) async {
    if (!_initialized) {
      await initialize();
    }
    await shearedPrefs.setBool('userLoggedIn', value);
  }

  //get user Logged
  static bool getUserLoggedIn() {
    bool is_login = false;
    if (!_initialized) {
      throw Exception("ShearedprefService is not initialized");
    }
    is_login = shearedPrefs.getBool('userLoggedIn') ?? false;
    return is_login;
  }

  //set  user Accestoken
  static Future<void> setUserAccessToken(String value) async {
    if (!_initialized) {
      await initialize();
    }
    await shearedPrefs.setString('userAccessToken', value);
  }

  //get user Accestoken
  static String? getUserAccessToken() {
    if (!_initialized) {
      throw Exception("ShearedprefService is not initialized");
    }
    return shearedPrefs.getString('userAccessToken');
  }

  //set  user Gmail
  static Future<void> setUserGmail(String value) async {
    if (!_initialized) {
      await initialize();
    }
    await shearedPrefs.setString('userGmail', value);
  }

  //get user Gmail
  static String? getUserGmail() {
    if (!_initialized) {
      throw Exception("ShearedprefService is not initialized");
    }
    return shearedPrefs.getString('userGmail');
  }

  //set  intro Screen
  static Future<void> setintroScreen(bool value) async {
    if (!_initialized) {
      await initialize();
    }
    await shearedPrefs.setBool('introScreen', value);
  }

  //get intro Screen
  static bool? getintroScreen() {
    if (!_initialized) {
      throw Exception("ShearedprefService is not initialized");
    }
    return shearedPrefs.getBool('introScreen');
  }

  static Future<bool> logoutAccount() {
    if (!_initialized) {
      throw Exception("ShearedprefService is not initialized");
    }
    var res = shearedPrefs.clear();
    return res;
  }

  //set  Device Token
  static Future<void> setDeviceToken(String value) async {
    if (!_initialized) {
      await initialize();
    }
    await shearedPrefs.setString('deviceToken', value);
  }

  //get Device Token
  static String? getDeviceToken() {
    if (!_initialized) {
      throw Exception("ShearedprefService is not initialized");
    }
    return shearedPrefs.getString('deviceToken');
  }
}
