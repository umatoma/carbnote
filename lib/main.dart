import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:intl/intl.dart';
import 'package:carbnote/view/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Intl.defaultLocale = 'ja_JP';
  await Firebase.initializeApp();

  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }

  runApp(
    const ProviderScope(
      child: LcApp(),
    ),
  );
}
