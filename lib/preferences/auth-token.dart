import 'package:shared_preferences/shared_preferences.dart';

class AuthPreference {
  Future<void> setToken(String token) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("token", token);
  }

  Future<String?> getToken() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.getString("token");
  }

  Future<void> setName (String name) async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("name", name);
  }

  Future<String?> getName() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.getString("name");
  }
  Future<void> setEmail (String email) async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("email", email);
  }

  Future<String?> getEmail() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.getString("email");
  }
}
