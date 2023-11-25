abstract class LanguageController {
  String changeLanguage(String langCode);
  String changeLanguageByName(String languageFullName);
  void saveNewLanguage(String langCode);
  Future<String> loadLanguage();
  String getLangCode();
}
