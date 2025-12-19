import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class StorageModule {
  @preResolve
  @singleton
  Future<Directory> get documentsDir => getApplicationDocumentsDirectory();
}
