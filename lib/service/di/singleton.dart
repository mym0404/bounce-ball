import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:local_file_preferences/local_file_preferences.dart';

import '../../export.dart';
import '../../feature/common/util/log_debug.dart';
import '../../game/state/game_manager.dart';
import '../../game/state/level_clear_storage.dart';
import '../l10n/util/l10n_manager.dart';
import '../layout/layout_manager.dart';
import '../user_preferences/user_preferences.dart';

Future<void> registerSingletons() async {
  di.registerSingleton(UserPreferences());

  var sharedPreferences = await SharedPreferences.getInstance();
  registerGlobalStorage(SharedPreferencesStorage(sharedPreferences: sharedPreferences));
  di.registerSingleton<LocalStorage>(SharedPreferencesLocalStorage(sharedPreferences));
  di.registerSingleton(L10NManager());
  di.registerSingleton(Logger());
  di.registerSingleton(LayoutManager());
  di.registerSingleton(GameManager());
  di.registerSingleton(LevelClearStorage());
}

Logger get log => di();
GameManager get manager => di();
LevelClearStorage get levelClearStorage => di();
FirebaseAnalytics get fbAnalytics => FirebaseAnalytics.instance;
UserPreferences get userPref => di();
