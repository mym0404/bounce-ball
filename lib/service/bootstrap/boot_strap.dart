import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../export.dart';
import '../../feature/common/widget/app_scroll_behavior.dart';
import '../../firebase_options.dart';
import '../l10n/util/l10n_manager.dart';
import '../router/app_router.dart';

Future<void> bootStrap() async {
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  await registerSingletons();
  await _initFirebase();
  _registerErrorHandler();
  Animate.defaultDuration = 500.ms;
  Animate.defaultCurve = Curves.easeInOutCubic;
  runApp(const BootStrapApp());
  100.ms.runAfter(() => FlutterNativeSplash.remove());
}

FutureOr<void> _initFirebase() async {
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    fbAnalytics.setAnalyticsCollectionEnabled(!kDebugMode);
  } catch (e) {}
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
      scrollBehavior: const AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
    );
  }
}
