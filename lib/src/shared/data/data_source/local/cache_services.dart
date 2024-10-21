import 'package:shared_preferences/shared_preferences.dart';

class CacheServices {
  CacheServices._();
  static final CacheServices _cacheServices = CacheServices._();

  factory CacheServices() => _cacheServices;

  static CacheServices getCacheServicesInstance = _cacheServices;

  static late SharedPreferences sharedPreferences;

  /// Initializes the cache services.
  static Future<void> initializeCache() async {
    await CacheServices.getCacheServicesInstance.initPreferences();
  }

  static const String _isLoginKey = "isLogin";
  static const _nameKey = "name";
  static const _accessTokenKey = "accessToken";
  static const _refreshTokenKey = "refreshToken";

  Future<SharedPreferences> initPreferences() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  /// Save boolean value indicating user login status.
  Future<bool> saveIsLogin(bool value) async {
    return await sharedPreferences.setBool(_isLoginKey, value);
  }

  /// Get saved user login status.
  bool getIsLogin() => sharedPreferences.getBool(_isLoginKey) ?? false;

  /// Get saved name.
  String getName() => sharedPreferences.getString(_nameKey) ?? "";

  /// Save user's name to SharedPreferences.
  Future<bool> saveName(String name) async {
    return await sharedPreferences.setString(_nameKey, name);
  }

  /// Get saved access token.
  String getAccessToken() => sharedPreferences.getString(_accessTokenKey) ?? "";

  /// Save user's access token to SharedPreferences.
  Future<bool> saveAccessToken(String accessToken) async {
    return await sharedPreferences.setString(_accessTokenKey, accessToken);
  }

  /// Get saved refresh token.
  String getRefreshToken() =>
      sharedPreferences.getString(_refreshTokenKey) ?? "";

  /// Save user's refresh token to SharedPreferences.
  Future<bool> saveRefreshToken(String refeshToken) async {
    return await sharedPreferences.setString(_refreshTokenKey, refeshToken);
  }
}
