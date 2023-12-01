import '../../export.dart';
import '../../feature/common/widget/blur.dart';
import '../../feature/common/widget/overlay_panel.dart';
import '../../service/user_preferences/user_preferences.dart';
import '../main_game.dart';
import 'overlay_id.dart';

class SettingsOverlay extends StatefulWidget with WatchItStatefulWidgetMixin {
  const SettingsOverlay({super.key});

  @override
  State<SettingsOverlay> createState() => _SettingsOverlayState();
}

class _SettingsOverlayState extends State<SettingsOverlay> {
  late final nickname = TC(text: '문명주');

  MainGame get game => di();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userPref = watchIt<UserPreferences>();
    return BackdropBlur(
      colorOpacity: 0.8,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: OverlayPanel(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                      child: Text(
                        'Settings',
                        style: TS.titleLarge,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        game.overlays.remove(OverlayId.settings);
                      },
                      icon: Icon(MdiIcons.close),
                    ),
                  ],
                ),
                const Gap(24),
                SwitchListTile(
                  title: const Text('Show control arrows'),
                  value: userPref.value.isShowArrowControls,
                  onChanged: (value) {
                    userPref.value = userPref.value.copyWith(isShowArrowControls: value);
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
