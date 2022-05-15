import 'package:shared_preferences/shared_preferences.dart';

class Cashe_Helper{
  static SharedPreferences? sharedPreferences;

   static Init()async{
     sharedPreferences = await SharedPreferences.getInstance();
   }

  static Future<bool?> PutBoolen({
  required String key,
  required bool value,
})async{
     return await sharedPreferences?.setBool('$key', value);
   }

   static bool?  getBoolen({
  required String key,
}){
     return  sharedPreferences?.getBool('$key');
   }

}