import '../../../export.dart';

enum Level {
  lv00(
    LevelWorlds.dummy0,
    '',
    0,
    0,
    'Are you ready to bounce?',
  ),
  lv01(
    LevelWorlds.unknownGalaxy01,
    'lv-01',
    36,
    24,
    'Hi everyone, Can you bounce?',
  ),
  lv02(
    LevelWorlds.unknownGalaxy01,
    'lv-02',
    36,
    24,
    'Going up is always pleased. Isn\'t it?',
  ),
  lv03(
    LevelWorlds.unknownGalaxy01,
    'lv-03',
    36,
    24,
    'What is under the ground?\nHave you ever imagine about it?',
  ),
  lv04(
    LevelWorlds.unknownGalaxy01,
    'lv-04',
    36,
    24,
    'It seems to impossible hah?',
  ),
  lv05(
    LevelWorlds.unknownGalaxy01,
    'lv-05',
    36,
    24,
    'This is really really impossible!?\nHint: This is the last stage',
  ),
  lv06(
    LevelWorlds.unknownGalaxy01,
    'lv-06',
    36,
    24,
    'Life isn\'t always easy',
  ),
  lv07(
    LevelWorlds.unknownGalaxy01,
    'lv-07',
    36,
    24,
    'Jump as high as possible',
  ),
  lv08(
    LevelWorlds.unknownGalaxy01,
    'lv-08',
    36,
    24,
    'Move like sneak',
  ),
  lv16(
    LevelWorlds.abandondGasStation02,
    'lv-16',
    36,
    24,
    'Welcome to New World!\na.k.a. Hello World!',
  ),
  ;

  static List<Level> get allLevels => Level.values.whereNot((e) => e.world == LevelWorlds.dummy0).toList();

  const Level(this.world, this.name, this.width, this.height, this.say);

  final int width, height;
  final String name, say;
  final LevelWorlds world;

  String get id => '${world.hashCode}-$hashCode';
}

enum LevelWorlds {
  dummy0(''),
  unknownGalaxy01('Unknown Planet'),
  abandondGasStation02('Abandoned Gas Station'),
  ;

  const LevelWorlds(this.name);

  final String name;

  AssetGenImage get sprite => switch (this) {
        LevelWorlds.unknownGalaxy01 => img.planet.world1,
        LevelWorlds.abandondGasStation02 => img.planet.world2,
        _ => img.planet.world1,
      };
  int get spriteAmount => switch (this) {
        LevelWorlds.unknownGalaxy01 => 24,
        LevelWorlds.abandondGasStation02 => 48,
        _ => 1,
      };
  double get spriteSize => switch (this) {
        LevelWorlds.unknownGalaxy01 => 128,
        LevelWorlds.abandondGasStation02 => 256,
        _ => 1,
      };
}
