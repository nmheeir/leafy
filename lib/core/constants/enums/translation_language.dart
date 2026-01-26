enum TranslationLanguage {
  vietnamese('vi', 'Tiếng Việt'),
  unitedStates('en', 'English (US)'),
  japanese('ja', 'Japanese'),
  chinese('zh', 'Chinese'),
  french('fr', 'French');

  final String code;
  final String displayName;

  const TranslationLanguage(this.code, this.displayName);
}
