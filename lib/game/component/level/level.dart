enum Level {
  lv01('lv-01', 36, 24),
  lv02('lv-02', 36, 24),
  ;

  final int width, height;
  final String name;

  const Level(this.name, this.width, this.height);
}
