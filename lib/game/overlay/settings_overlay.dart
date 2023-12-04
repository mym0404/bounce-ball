import '../../export.dart';
import '../../service/user_preferences/user_preferences.dart';
import '../main_game.dart';

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
    return Column(
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
                Navigator.pop(context);
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
    );
  }
}
