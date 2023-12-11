import '../../../export.dart';
import '../../../service/user_preferences/user_preferences.dart';
import '../../main_game.dart';
import '../widget/panel_header.dart';

class SettingsDialog extends StatefulWidget with WatchItStatefulWidgetMixin {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  late final nickname = TC(text: '문명주');

  MainGame get game => di();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userPref = watchIt<UserPreferences>();
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PanelHeader(title: context.s.setting_title),
          const Gap(24),
          SwitchListTile(
            title: const Text('Show control arrows'),
            value: userPref.value.isShowArrowControls,
            onChanged: (value) {
              userPref.value = userPref.value.copyWith(isShowArrowControls: value);
            },
            contentPadding: EdgeInsets.zero,
          ),
          const Gap(12),
          const Text('Camera Zoom Scale'),
          VL(
            valueListenable: userPref,
            builder: (context, pref, child) {
              return Slider(
                value: pref.cameraZoomScale,
                onChanged: (value) {
                  userPref.value = userPref.value.copyWith(cameraZoomScale: value);
                  game.camera = game.createCameraByZoomScale(
                      world: game.world, zoomScale: userPref.value.cameraZoomScale);
                },
                min: 0.3,
                max: 3,
              );
            },
          ),
        ],
      ),
    );
  }
}
