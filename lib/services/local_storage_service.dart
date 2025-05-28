import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

mixin LocalStorageService {
  static late SharedPreferences prefs;
  static Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static set textScaleFactor(double value) =>
      prefs.setDouble('textScaleFactor', value);
  static double get textScaleFactor =>
      prefs.getDouble('textScaleFactor') ?? 1.0;

  static set appOpenCount(int value) => prefs.setInt('app_open_count', value);
  static int get appOpenCount => prefs.getInt('app_open_count') ?? 0;

  static set id(int? value) => prefs.setInt('user_id', value ?? 0);
  static int get id => getUserData['id'] ?? 0;

  static set parentId(int? value) => prefs.setInt('parentId', value ?? 0);
  static int get parentId => prefs.getInt('parentId') ?? 0;

  static set cognito(String? value) => prefs.setString('cognito', value ?? "");
  static String get cognito => prefs.getString('cognito') ?? "";

  static set setUserData(Map<String, dynamic> value) =>
      prefs.setString('user_data', jsonEncode(value));
  static Map<String, dynamic> get getUserData =>
      prefs.getString('user_data') != null
          ? jsonDecode(prefs.getString('user_data')!)
          : {};

  static set isTestMode(bool value) => prefs.setBool('isTestMode', value);
  static bool get isTestMode => true; //prefs.getBool('isTestMode') ?? false;

  static set isStaging(bool value) => prefs.setBool('isStaging', value);
  static bool get isStaging => true; //prefs.getBool('isStaging') ?? false;

  static set testers(List<String> value) =>
      prefs.setStringList('testers', value);
  static List<String> get testers => prefs.getStringList('testers') ?? [];

  static set onToken(String value) => prefs.setString('access_token', value);
  static String get onToken => prefs.getString('access_token') ?? "";

  static set setUserProfileImage(String value) =>
      prefs.setString('user_profile_image', value);
  static String? get getUserProfileImage =>
      prefs.getString('user_profile_image');

  static set onFCMToken(String value) => prefs.setString('fcm_token', value);
  static String get onFCMToken => prefs.getString('fcm_token') ?? "";

  static set setLongitude(double value) => prefs.setDouble('latitude', value);
  static double get getLongitude => prefs.getDouble('latitude') ?? 0.0;

  static set setLatitude(double value) => prefs.setDouble('longitude', value);
  static double get getLatitude => prefs.getDouble('longitude') ?? 0.0;

  static set setRole(String value) => prefs.setString('user_role', value);
  static String get getRole => prefs.getString('user_role') ?? "";

  static set setRoleType(String value) =>
      prefs.setString('user_role_type', value);
  static String get getRoleType => prefs.getString('user_role_type') ?? "";
}
