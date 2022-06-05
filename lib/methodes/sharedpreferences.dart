

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
   static SharedPreferences? pref ;
  static Future init() async =>
      pref = await SharedPreferences.getInstance();
  
}