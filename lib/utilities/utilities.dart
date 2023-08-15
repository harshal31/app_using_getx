import 'dart:ui';

class Helper {
  static Locale getSelectedLocale(String selectedLanguage) {
    var split = selectedLanguage.split(":");
    return Locale(split[0], split[1]);
  }

  static String getLocaleAsFormat(Locale locale) {
    return locale.toString().replaceAll("_", ":");
  }

  static String getStringLocaleAsFormat(String locale) {
    return locale.replaceAll("_", ":");
  }
}
