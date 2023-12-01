abstract interface class LevelManager {
  static const expForEachLevel = <int>[
    10, // 1
    20, // 2
    30, // 3
    50, // 4
    100, // 5
    200, // 6
    500, // 7
    1000, // 8
    2000, // 9
  ];

  static const hpForEachLevel = <int>[
    10, // 1
    20, // 2
    30, // 3
    40, // 4
    50, // 5
    60, // 6
    70, // 7
    80, // 8
    90, // 9
    100, // 10
  ];

  static (int level, int exp) expToLevel(int exp) {
    int retLevel = 1, retExp = exp;
    for (int i = 0; i < expForEachLevel.length; i++) {
      if (exp >= expForEachLevel[i]) {
        retLevel++;
        exp -= expForEachLevel[i];
        retExp = exp;
      } else {
        break;
      }
    }
    return (retLevel, retExp);
  }

  static bool isMaxLevel(int exp) {
    return exp >= expForEachLevel.reduce((value, element) => value + element);
  }

  static int nextLevelRequiredExp(int exp) {
    if (isMaxLevel(exp)) return 0;
    return expForEachLevel[expToLevel(exp).$1];
  }

  static int expInCurrentLevel(int exp) {
    return expToLevel(exp).$2;
  }

  static int maxHpByExp(int exp) {
    return hpForEachLevel[expToLevel(exp).$1 - 1];
  }
}
