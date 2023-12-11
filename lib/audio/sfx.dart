import 'package:flame_audio/flame_audio.dart';

import '../export.dart';
import '../game/component/level/Level.dart';
import '../service/user_preferences/user_preferences.dart';

class Sfx {
  UserPreferences get pref => di();
  late AudioPool arrowAP, bounceAP, clearAP, dieBombAP, dieOutOfBoundAP, jumpWallAP;

  String lastBgm = '';
  AudioPlayer? bgmPlayer;

  Future<void> init() async {
    FlameAudio.bgm.initialize();

    await FlameAudio.audioCache.loadAll(
      [
        ...sfxs.values.map((e) => e.audioPath),
        ...sfxs.bgm.values.map((e) => e.audioPath),
      ],
    );

    arrowAP = await FlameAudio.createPool(sfxs.arrow.audioPath, maxPlayers: 1);
    bounceAP = await FlameAudio.createPool(sfxs.bounce.audioPath, maxPlayers: 3);
    clearAP = await FlameAudio.createPool(sfxs.clear.audioPath, maxPlayers: 1);
    dieBombAP = await FlameAudio.createPool(sfxs.dieBomb.audioPath, maxPlayers: 1);
    dieOutOfBoundAP = await FlameAudio.createPool(sfxs.dieOutofbound.audioPath, maxPlayers: 1);
    jumpWallAP = await FlameAudio.createPool(sfxs.jumpWall.audioPath, maxPlayers: 2);

    pref.addListener(() {
      bgmPlayer?.setVolume(pref.value.isBgmSoundEnable ? pref.value.bgmVolumn : 0);
    });
  }

  Future<void> dispose() async {
    bgmPlayer?.dispose();
  }

  Future<void> playBgm(Level level) async {
    if (lastBgm == level.world.bgm.audioPath) return;
    bgmPlayer?.dispose();
    bgmPlayer = await FlameAudio.loop(level.world.bgm.audioPath,
        volume: pref.value.isBgmSoundEnable ? pref.value.bgmVolumn : 0);
    lastBgm = level.world.bgm.audioPath;
  }

  void _playEffect(AudioPool pool) {
    if (!pref.value.isEffectSoundEnable) return;
    pool.start(volume: pref.value.effectVolumn);
  }

  void playArrow() => _playEffect(arrowAP);
  void playBounce() => _playEffect(bounceAP);
  void playClear() => _playEffect(clearAP);
  void playDieBomb() => _playEffect(dieBombAP);
  void playDieOutOfBound() => _playEffect(dieOutOfBoundAP);
  void playJumpWall() => _playEffect(jumpWallAP);
}
