import '../../export.dart';
import '../state/game_manager.dart';

class GameStatusPanel extends StatelessWidget with WatchItMixin {
  const GameStatusPanel({super.key});

  @override
  Widget build(BuildContext context) {
    var level = watchValue((GameManager e) => e.level);
    var deathCount = watchValue((GameManager e) => e.deathCount);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'BOUNCE    BALL  (0.0.1)',
          style: TS.t3.bold,
        ),
        Text('LV ${level.name.split('').where((element) => RegExp(r'\d').hasMatch(element)).join()}'),
        Text('DIE $deathCount'),
      ],
    );
  }
}
