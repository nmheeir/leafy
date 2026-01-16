import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leafy/router/router.dart';

late Directory appDocumentsDirectory;
late Directory appTempDirectory;
late DateFormat dateFormat;
late GlobalKey<ScaffoldMessengerState> snackbarKey;
final appRouter = router();
