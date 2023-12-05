import '../../../export.dart';
import '../../state/game_manager.dart';

class GameStatusPanel extends StatelessWidget with WatchItMixin {
  const GameStatusPanel({super.key});

  @override
  Widget build(BuildContext context) {
    var level = watchValue((GameManager e) => e.level);
    var deathCount = watchValue((GameManager e) => e.deathCount);
    var isGameStarted = watchValue((GameManager e) => e.isGameStarted);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'BOUNCE    BALL  (0.1.0)',
          style: TS.t3.bold,
        ),
        if (isGameStarted)
          Text(
              '${level.world.name} - ${level.name.split('').where((element) => RegExp(r'\d').hasMatch(element)).join()}'),
        if (isGameStarted) Text('DIE $deathCount'),
      ],
    );
  }
}
