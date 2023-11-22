import 'package:shared_preferences/shared_preferences.dart';


final Future<SharedPreferences> savedProperites = SharedPreferences.getInstance();

Future<bool?> loadProperties() async{
  final SharedPreferences prefs = await savedProperites;
  final bool? rememberMe = prefs.getBool('rememberMe');
  return rememberMe;
}
