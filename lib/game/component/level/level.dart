import '../../../export.dart';

enum Level {
  lv0_0(
    LevelWorlds.dummy0,
    '',
    '',
    0,
    0,
    'Are you ready to bounce?',
  ),
  lv1_1(
    LevelWorlds.unknownGalaxy01,
    'lv1_1',
    '01-Unknown Area',
    36,
    24,
    'Hi everyone, Can you bounce?',
  ),
  lv1_2(
    LevelWorlds.unknownGalaxy01,
    'lv1_2',
    '02-Unknown Stair',
    36,
    24,
    'Going up is always pleased. Isn\'t it?',
  ),
  lv1_3(
    LevelWorlds.unknownGalaxy01,
    'lv1_3',
    '03-Unknown Halls',
    36,
    24,
    'What is under the ground?\nHave you ever imagine about it?',
  ),
  lv1_4(
    LevelWorlds.unknownGalaxy01,
    'lv1_4',
    '04-Unknown Space',
    36,
    24,
    'It seems to impossible hah?',
  ),
  lv1_5(
    LevelWorlds.unknownGalaxy01,
    'lv1_5',
    '05-Unknown Wide Space',
    36,
    24,
    'This is really really impossible!?\nHint: This is the last stage',
  ),
  lv1_6(
    LevelWorlds.unknownGalaxy01,
    'lv1_6',
    '06-Unknown Breakables',
    36,
    24,
    'Life isn\'t always easy',
  ),
  lv1_7(
    LevelWorlds.unknownGalaxy01,
    'lv1_7',
    '07-Unknown Arrow',
    36,
    24,
    'Jump as high as possible',
  ),
  lv1_8(
    LevelWorlds.unknownGalaxy01,
    'lv1_8',
    '08-Unknown Sky Diving',
    36,
    24,
    'Move like sneak',
  ),
  lv2_1(
    LevelWorlds.weirdForest02,
    'lv2_1',
    '01-Enter to weridness',
    36,
    24,
    'Wow, where it is?',
  ),
  lv5_1(
    LevelWorlds.abandonedGasStation05,
    'lv5_1',
    '01-So many abandoned',
    36,
    24,
    'Welcome to New World!',
  ),
  ;

  static List<Level> get allLevels => Level.values.whereNot((e) => e.world == LevelWorlds.dummy0).toList();

  const Level(this.world, this.tileName, this.name, this.width, this.height, this.say);

  final int width, height;
  final String tileName, name, say;
  final LevelWorlds world;

  String get id => '${world.index}-$index';
}

enum LevelWorlds {
  dummy0(''),
  unknownGalaxy01('Unknown Planet'),
  weirdForest02('Weird Forest'),
  abandonedGasStation05('Abandoned Gas Station'),
  ;

  const LevelWorlds(this.name);

  final String name;

  AssetGenImage get sprite => switch (this) {
        LevelWorlds.unknownGalaxy01 => img.planet.world1,
        LevelWorlds.weirdForest02 => img.planet.world2,
        LevelWorlds.abandonedGasStation05 => img.planet.world5,
        LevelWorlds.dummy0 => img.planet.world1,
      };
  int get spriteAmount => switch (this) {
        LevelWorlds.unknownGalaxy01 => 24,
        LevelWorlds.weirdForest02 => 50,
        LevelWorlds.abandonedGasStation05 => 48,
        LevelWorlds.dummy0 => 1,
      };
  double get spriteSize => switch (this) {
        LevelWorlds.unknownGalaxy01 => 128,
        LevelWorlds.weirdForest02 => 128,
        LevelWorlds.abandonedGasStation05 => 256,
        LevelWorlds.dummy0 => 1,
      };
  String get bgm => switch (this) {
        LevelWorlds.unknownGalaxy01 => sfxs.bgm.world1,
        LevelWorlds.weirdForest02 => sfxs.bgm.world2,
        LevelWorlds.abandonedGasStation05 => sfxs.bgm.world5,
        LevelWorlds.dummy0 => sfxs.bgm.world1,
      };
  String get bgmName => switch (this) {
        LevelWorlds.unknownGalaxy01 => 'Retro Platforming - David Fesliyan',
        LevelWorlds.weirdForest02 => 'Boss Time - David Renda',
        LevelWorlds.abandonedGasStation05 => 'Undertale MEGALOVANIA - Camellia Remix',
        LevelWorlds.dummy0 => '',
      };
}
