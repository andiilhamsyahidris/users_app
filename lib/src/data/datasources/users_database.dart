import 'package:shared_preferences/shared_preferences.dart';

class UsersDatabase {
  static const userName = 'name';
  static UsersDatabase? _usersDatabase;
  UsersDatabase._instance() {
    _usersDatabase = this;
  }
  static SharedPreferences? _preferences;

  Future<SharedPreferences?> get preferences async {
    _preferences ??= await _initPreference();
    return _preferences;
  }

  factory UsersDatabase() => _usersDatabase ?? UsersDatabase._instance();

  Future<SharedPreferences> _initPreference() async {
    final pr = await SharedPreferences.getInstance();
    return pr;
  }

  Future<bool> checkUserNameExist() async {
    final pr = await preferences;
    return pr!.containsKey(userName);
  }

  Future<bool> setUserId(String name) async {
    final pr = await preferences;
    return pr!.setString(userName, name);
  }

  Future<String?> getUserId(String query) async {
    final pr = await preferences;
    bool? checkName = pr!.containsKey(query);

    if (checkName) {
      String? userId = pr.getString(userName);
      return userId!;
    }
    return null;
  }
}
