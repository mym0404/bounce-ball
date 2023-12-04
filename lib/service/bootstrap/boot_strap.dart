import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../export.dart';
import '../../firebase_options.dart';
import '../l10n/util/l10n_manager.dart';
import '../router/app_router.dart';

Future<void> bootStrap() async {
  await _initFirebase();
  await registerSingletons();
  _registerErrorHandler();
  runApp(const BootStrapApp());
}

FutureOr<void> _initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // fbAnalytics.setAnalyticsCollectionEnabled(!kDebugMode);
}

void _registerErrorHandler() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    log.e('flutter Error Occurred', error: details.exception, stackTrace: details.stack);
  };
  PlatformDispatcher.instance.onError = (exception, stackTrace) {
    log.e('Platform Error Occurred', error: exception, stackTrace: stackTrace);
    return true;
  };
}

class BootStrapApp extends StatelessWidget with WatchItMixin {
  const BootStrapApp({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = watchPropertyValue((L10NManager settings) => settings.locale);

    return MaterialApp.router(
      routerConfig: appRouter,
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme.instance.createTheme(Brightness.dark),
      darkTheme: AppTheme.instance.createTheme(Brightness.dark),
      themeMode: ThemeMode.dark,
      // scrollBehavior: const AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
    );
  }
}
