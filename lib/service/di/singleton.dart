import 'package:local_file_preferences/local_file_preferences.dart';
import 'package:logger/logger.dart';

import '../../export.dart';
import '../../game/state/game_manager.dart';
import '../../game/util/user_thumbnail_util.dart';
import '../l10n/util/l10n_manager.dart';
import '../layout/layout_manager.dart';
import '../user_preferences/user_preferences.dart';

Future<void> registerSingletons() async {
  di.registerSingleton(UserPreferences());
  di.registerSingleton(UserThumbnailUtil());

  var sharedPreferences = await SharedPreferences.getInstance();
  registerGlobalStorage(SharedPreferencesStorage(sharedPreferences: sharedPreferences));
  di.registerSingleton<LocalStorage>(SharedPreferencesLocalStorage(sharedPreferences));
  di.registerSingleton(L10NManager());
  di.registerSingleton(
    Logger(
      printer: PrefixPrinter(
        PrettyPrinter(colors: false, methodCount: 0, errorMethodCount: 20),
        error: '⛔',
        info: '💡',
        debug: '🌙',
      ),
    ),
  );
  di.registerSingleton(LayoutManager());

  di.registerSingleton(GameManager());
}

Logger get log => di();
GameManager get manager => di();
