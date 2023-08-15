import 'package:app_using_getx/app/data/languages.dart';
import 'package:app_using_getx/app/translations/mr-IN/mr_in_translations.dart';
import 'package:app_using_getx/app/translations/strings.dart';
import '../../app/translations/en_US/en_us_translations.dart';
import '../../app/translations/vi_VN/vi_vn_translations.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': enUs,
      'vi': viVn,
      'mr': mrIN,
    };
  }
}

var supportedLanguages = [
  Language("en:US", english.tr, false),
  Language("mr:IN", marathi.tr, false),
  Language("vi:VN", vietnamese.tr, false),
];
