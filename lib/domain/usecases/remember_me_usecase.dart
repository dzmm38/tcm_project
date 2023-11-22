import 'package:shared_preferences/shared_preferences.dart';

class RememberMeUseCase{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  Future<bool?> getRemember() async{
    final SharedPreferences prefs = await _prefs;
    final bool? rememberMe = prefs.getBool('rememberMe');
    return rememberMe;
  }

  void setRemember(isChecked) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('rememberMe', isChecked);
  }

}