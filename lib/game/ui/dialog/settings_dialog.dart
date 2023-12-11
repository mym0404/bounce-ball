import 'package:url_launcher/url_launcher_string.dart';

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
    var pref = watchIt<UserPreferences>().value;
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PanelHeader(title: context.s.setting_title),
          const Gap(12),
          TabBar(tabs: [
            Tab(
              text: 'Input',
            ),
            Tab(
              text: 'Display',
            ),
            Tab(
              text: 'Sound',
            ),
            Tab(
              text: 'About',
            ),
          ]),
          Expanded(
            child: TabBarView(children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(24),
                    const Text('Camera Zoom Scale'),
                    Slider(
                      value: pref.cameraZoomScale,
                      onChanged: (value) {
                        userPref.value = userPref.value.copyWith(cameraZoomScale: value);
                        game.camera = game.createCameraByZoomScale(
                            world: game.world, zoomScale: userPref.value.cameraZoomScale);
                      },
                      min: 0.3,
                      max: 3,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(24),
                    Row(
                      children: [
                        const Text('BGM Volumn'),
                        const Gap(8),
                        const Gap(8),
                        IconButton.filledTonal(
                          onPressed: () => di<UserPreferences>().value =
                              pref.copyWith(isBgmSoundEnable: !pref.isBgmSoundEnable),
                          icon: Icon(pref.isBgmSoundEnable ? MdiIcons.volumeSource : MdiIcons.volumeOff),
                        ),
                      ],
                    ),
                    Slider(
                      value: pref.bgmVolumn,
                      onChanged: (value) {
                        userPref.value = userPref.value.copyWith(bgmVolumn: value);
                      },
                      min: 0,
                      max: 1,
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        const Text('Effect Volumn'),
                        const Gap(8),
                        IconButton.filledTonal(
                          onPressed: () => di<UserPreferences>().value =
                              pref.copyWith(isEffectSoundEnable: !pref.isEffectSoundEnable),
                          icon: Icon(pref.isEffectSoundEnable ? MdiIcons.volumeSource : MdiIcons.volumeOff),
                        ),
                      ],
                    ),
                    Slider(
                      value: pref.effectVolumn,
                      onChanged: (value) {
                        userPref.value = userPref.value.copyWith(effectVolumn: value);
                      },
                      min: 0,
                      max: 1,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(24),
                    const Text(
                      'Thank you for playing',
                      style: TS.h3,
                    ),
                    const Gap(12),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          launchUrlString('https://www.mjstudio.net/');
                        },
                        child: Text(
                          'Visit MJ Studio',
                          style:
                              TS.l2.c(Colors.blueAccent).bold.copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
