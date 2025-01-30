import 'en.dart';

//механізм локалізації
class Localizer {
  static late Map<String, String> _strings;
  static late Map<String, String> _en;

  static void init(String code) {
    _en = English().get();
    switch (code) {
      default:
        _strings = _en;
    }
  }

  static String get(String key) {
    try{
      return _strings[key] ?? getEn(key);
    } catch(e){
      return key;
    }
  }

  static String getEn(String key) {
    return _en[key] ?? key;
  }
}