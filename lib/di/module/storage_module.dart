import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class StorageModule {
  @preResolve
  @singleton
  Future<Directory> get documentsDir => getApplicationDocumentsDirectory();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
