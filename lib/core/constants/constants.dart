abstract final class Constants {
  static const appName = 'Leafy';

  static const duckDuckGoURL = 'https://duckduckgo.com/';
  static const duckDuckGoImagesURL = 'https://duckduckgo.com/i.js';

  static const blurHashX = 2;
  static const blurHashY = 2;

  static const double formHeight = 60.0;

  static const maxTagLength = 10;

  static const tagDelimeter = '|||||';

  static const fonts = [
    {'text': 'Nunito', 'family': 'Nunito'},
  ];
}

const double cornerRadius = 8;

class SharedPreferencesKeys {
  static const coverMigrationDone = 'is_cover_migration_done';
  static const duckDuckGoWarning = 'show_duck_duck_go_warning';
}
