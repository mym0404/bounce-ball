import 'package:flutter_animate/flutter_animate.dart';

import '../../../export.dart';
import '../../component/level/Level.dart';
import '../../network/score_repository.dart';
import '../../state/score_schema.dart';

class GameClearScoreDialog extends StatefulWidget {
  const GameClearScoreDialog({
    super.key,
    required this.level,
    required this.score,
  });

  final Level level;
  final ScoreSchema score;

  @override
  State<GameClearScoreDialog> createState() => _GameClearScoreDialogState();
}

class _GameClearScoreDialogState extends State<GameClearScoreDialog> {
  var isLoading = false;
  void _onPressOk() {
    Navigator.pop(context);
  }

  void _onPressShare() {}

  void _onPressRegisterRanking() async {
    setState(() => isLoading = true);
    context.showInfoSnackBar(text: context.s.register_ranking_start);
    try {
      await ScoreRepository().saveRecord(
        level: widget.level,
        score: widget.score,
        name: 'Beta Tester ${Random().nextInt(500)}',
      );
      context.showSuccessSnackBar(text: context.s.register_ranking_done);
    } catch (e) {
      log.e(e);
      context.showErrorSnackBar(text: context.s.g_error);
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKey: (node, event) {
        if (event.isKeyPressed(LogicalKeyboardKey.enter) || event.isKeyPressed(LogicalKeyboardKey.space)) {
          _onPressOk();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${context.s.g_clear}!',
            style: TS.t2,
          ).animate().fadeIn(),
          const Gap(24),
          _buildItem(context.s.g_world, widget.level.world.name),
          const Gap(8),
          _buildItem(context.s.g_level, widget.level.name),
          const Gap(24),
          _buildItem(context.s.g_time, '${(widget.score.timeMs / 1000).toStringAsFixed(3)}ms'),
          const Gap(8),
          _buildItem(context.s.g_bounce, widget.score.bounceCount.toString()),
          const Gap(8),
          _buildItem(context.s.g_death, widget.score.deathCount.toString()),
          const Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // OutlinedButton.icon(
              //   icon: Icon(MdiIcons.shareAllOutline),
              //   onPressed: _onPressShare,
              //   label: Text(context.s.g_share),
              // ),
              // const Gap(12),
              OutlinedButton(
                onPressed: isLoading ? null : _onPressRegisterRanking,
                child: Text(context.s.register_ranking),
              ),
              const Gap(12),
              FilledButton.tonal(onPressed: _onPressOk, child: Text(context.s.g_confirm)),
            ],
          ).animate().fadeIn(delay: 1.seconds),
        ],
      ),
    );
  }

  Widget _buildItem(String title, String value) {
    return Row(
      children: [
        Expanded(child: Text(title, style: TS.b3.onSurface70.italic)),
        Text(value, style: TS.b3.bold),
      ],
    );
  }
}
