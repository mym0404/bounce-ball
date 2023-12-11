import '../../../export.dart';
import '../../../feature/common/data/task.dart';
import '../../../feature/common/widget/empty_state.dart';
import '../../../feature/common/widget/loading_state.dart';
import '../../../feature/common/widget/signature_renderer.dart';
import '../../component/level/Level.dart';
import '../../network/score_repository.dart';
import '../../state/score_schema.dart';

class ScoreRankingPanel extends StatefulWidget {
  const ScoreRankingPanel({
    super.key,
    required this.level,
  });

  final Level level;

  @override
  State<ScoreRankingPanel> createState() => _ScoreRankingPanelState();
}

class _ScoreRankingPanelState extends State<ScoreRankingPanel> {
  late final rankingByTime = Task0(() => ScoreRepository().listRecordByTime(level: widget.level))..call();
  late final rankingByBounce = Task0(() => ScoreRepository().listRecordByBounce(level: widget.level))..call();

  @override
  void didUpdateWidget(covariant ScoreRankingPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.level != widget.level) {
      rankingByTime();
      rankingByBounce();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(
              text: context.s.ranking_tab_time,
            ),
            Tab(
              text: context.s.ranking_tab_bounce,
            )
          ],
        ),
        body: TabBarView(children: [
          _buildRanking(rankingByTime, isTimeRanking: true),
          _buildRanking(rankingByBounce, isTimeRanking: false),
        ]),
      ),
    );
  }

  Widget _buildRanking(Task<List<ScoreSchema>> task, {required bool isTimeRanking}) {
    return TaskBuilder(
      task,
      loading: (context, state, data) => const PaddingVertical(24, child: LoadingState()),
      emptyData: (context, state) => const PaddingVertical(24, child: EmptyState()),
      success: (context, state, data) => CustomScrollView(
        slivers: [
          // SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverList(
            key: PageStorageKey(isTimeRanking),
            delegate: SliverChildBuilderDelegate((context, index) {
              var score = data[index];
              var createdText = score.created.format('yyyy-MM-dd');

              return PaddingAll(
                12,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              index <= 2
                                  ? Icon(
                                      MdiIcons.trophy,
                                      color: [Colors.amber, Colors.grey, Colors.brown][index],
                                    )
                                  : Text(
                                      '   ${index + 1}',
                                      style: TS.b1.bold,
                                    ),
                            ],
                          ),
                          const Gap(12),
                          Text(
                            isTimeRanking
                                ? '${(score.timeMs / 1000).toStringAsFixed(3)}ms'
                                : '${score.bounceCount} bounces',
                            style: TS.b2.bold,
                          ),
                          const Gap(8),
                          Text(createdText, style: TS.l2.italic.onSurface50),
                        ],
                      ),
                    ),
                    SignatureRenderer(points: score.signaturePoints, size: 100),
                  ],
                ),
              );
            }, childCount: data.length),
          ),
        ],
      ),
    );
  }
}
