abstract final class Constants {
  static const appName = 'Leafy';

  static const duckDuckGoURL = 'https://duckduckgo.com/';
  static const duckDuckGoImagesURL = 'https://duckduckgo.com/i.js';
  static const String coverBaseUrl = 'https://covers.openlibrary.org/';
  static const String gutendexUrl = 'https://gutendex.com/books';

  static const blurHashX = 2;
  static const blurHashY = 2;

  static const double formHeight = 60.0;

  static const maxTagLength = 10;

  static const tagDelimeter = '|||||';

  static const fonts = [
    {'text': 'Nunito', 'family': 'Nunito'},
    {'text': 'Atkinson Hyperlegible', 'family': 'Atkinson Hyperlegible'},
    {'text': 'Barlow', 'family': 'Barlow'},
    {'text': 'Inter', 'family': 'Inter'},
    {'text': 'Jost', 'family': 'Jost'},
    {'text': 'Kanit', 'family': 'Kanit'},
    {'text': 'Lato', 'family': 'Lato'},
    {'text': 'Lora', 'family': 'Lora'},
    {'text': 'Montserrat', 'family': 'Montserrat'},
    {'text': 'Poppins', 'family': 'Poppins'},
    {'text': 'Quicksand', 'family': 'Quicksand'},
    {'text': 'Raleway', 'family': 'Raleway'},
    {'text': 'Sofia Sans', 'family': 'Sofia Sans'},
  ];
}

const double cornerRadius = 8;

class SharedPreferencesKeys {
  static const coverMigrationDone = 'is_cover_migration_done';
  static const duckDuckGoWarning = 'show_duck_duck_go_warning';
}
