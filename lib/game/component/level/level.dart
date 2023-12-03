enum Level {
  lv01('lv-01', 36, 24, 'Hi everyone, Can you bounce?'),
  lv02('lv-02', 36, 24, 'Going up is always pleased. Isn\'t it?'),
  lv03('lv-03', 36, 24, 'What is under the ground?\nHave you ever imagine about it?'),
  lv04('lv-04', 36, 24, 'It seems to impossible hah?'),
  lv05('lv-05', 36, 24, 'This is really really impossible!?\nHint: This is the last stage'),
  lv06('lv-06', 36, 24, 'Life isn\'t always easy'),
  lv07('lv-07', 36, 24, 'Show me what you would jump\nwithout limit'),
  lv16('lv-16', 36, 24, 'Welcome to New World!\na.k.a. Hello World!'),
  ;

  final int width, height;
  final String name, say;

  const Level(this.name, this.width, this.height, this.say);
}
