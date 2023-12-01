enum Level {
  lv01('lv-01', 36, 24, 'Hi everyone, Can you bounce?'),
  lv02('lv-02', 36, 24, 'Going up is always pleased. Isn\'t it?'),
  lv03('lv-03', 36, 24, 'What is under the ground?\nHave you ever imagine about it?'),
  ;

  final int width, height;
  final String name, say;

  const Level(this.name, this.width, this.height, this.say);
}
