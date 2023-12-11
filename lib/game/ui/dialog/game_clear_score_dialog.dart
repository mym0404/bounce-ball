import '../../../export.dart';
import '../../../feature/common/widget/app_dialog.dart';
import '../../component/level/Level.dart';
import '../../state/score_schema.dart';
import '../panel/score_ranking_panel.dart';
import '../widget/panel_header.dart';
import 'ranking_register_dialog.dart';

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
  bool _isRankingRegistered = false;

  void _onPressNextStage() {
    Navigator.pop(context);
    manager.moveToNextLevel();
  }

  void _onPressRestart() {
    Navigator.pop(context);
    manager.restartThisStage();
  }

  void _onPressRegisterRanking() async {
    Object? result = await showAppDialog(
      context,
      (context) => RankingRegisterDialog(
        level: widget.level,
        score: widget.score,
      ),
    );
    if (result == true) {
      setState(() => _isRankingRegistered = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cont) {
        var width = cont.maxWidth;
        var isWideLayout = width >= 500;
        return Stack(
          children: [
            Column(
              children: [
                PanelHeader(
                  title: context.s.g_clear,
                  hideBack: true,
                  right: [
                    OutlinedButton(onPressed: _onPressRestart, child: Text(context.s.restart)),
                    const Gap(8),
                    FilledButton.tonal(onPressed: _onPressNextStage, child: Text(context.s.next_stage)),
                  ],
                ),
                const Gap(20),
                Expanded(
                  child: isWideLayout
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PaddingHorizontal(12, child: SizedBox(width: 200, child: _buildScorePanel())),
                            const VerticalDivider(),
                            Expanded(child: _buildScoreRankingPanel()),
                          ],
                        )
                      : NestedScrollView(
                          headerSliverBuilder: (context, innerBoxIsScrolled) {
                            return [
                              SliverToBoxAdapter(
                                child: _buildScorePanel(),
                              )
                            ];
                          },
                          body: PaddingTop(24, child: _buildScoreRankingPanel()),
                        ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Opacity(
                opacity: 0.5,
                child: Assets.lottie.clear.lottie(width: 160, height: 160, repeat: true),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildScoreRankingPanel() {
    return KeyedSubtree(
      key: ValueKey(_isRankingRegistered),
      child: Column(
        children: [
          Text(context.s.g_ranking, style: TS.t3.bold),
          const Gap(12),
          if (!_isRankingRegistered)
            TextButton.icon(
              onPressed: _onPressRegisterRanking,
              icon: Icon(MdiIcons.send),
              label: Text(context.s.register_ranking),
            ),
          const Gap(12),
          Expanded(
            child: ScoreRankingPanel(
              level: widget.level,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScorePanel() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(context.s.g_score, style: TS.t3.bold),
        const Gap(24),
        _buildItem(context.s.g_world, widget.level.world.name),
        const Gap(12),
        _buildItem(context.s.g_level, widget.level.name),
        const Gap(24),
        _buildItem(context.s.g_time, '${(widget.score.timeMs / 1000).toStringAsFixed(3)}ms'),
        const Gap(12),
        _buildItem(context.s.g_bounce, widget.score.bounceCount.toString()),
        const Gap(12),
        _buildItem(context.s.g_death, widget.score.deathCount.toString()),
      ],
    );
  }

  Widget _buildItem(String title, String value) {
    return Row(
      children: [
        Expanded(child: Text(title, style: TS.b2.onSurface70.italic)),
        Text(value, style: TS.b2.bold),
      ],
    );
  }
}
