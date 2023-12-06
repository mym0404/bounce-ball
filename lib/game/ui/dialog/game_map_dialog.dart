import 'package:flame/widgets.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../export.dart';
import '../../../feature/common/widget/empty_state.dart';
import '../../../feature/common/widget/loading_state.dart';
import '../../component/level/Level.dart';
import '../../network/score_repository.dart';
import '../../state/score_schema.dart';

class GameMapDialog extends StatefulWidget {
  const GameMapDialog({super.key});

  @override
  State<GameMapDialog> createState() => _GameMapDialogState();
}

class _GameMapDialogState extends State<GameMapDialog> {
  bool _isShowScore = false;
  bool _isLoading = false;
  Level selectedLevel = Level.lv00;
  List<ScoreSchema> _rankings = [];

  void _fetchLevelRanking(Level level) async {
    setState(() {
      _isLoading = true;
      _rankings = [];
      selectedLevel = level;
    });
    try {
      _rankings = await ScoreRepository().listRecordByTime(level: level);
    } catch (e) {
      log.e(e);
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: _isShowScore ? 0 : 1,
          duration: 500.ms,
          child: GroupedListView(
            padding: const EdgeInsets.only(bottom: 32),
            elements: Level.allLevels,
            groupBy: (Level e) => e.world.index,
            groupHeaderBuilder: (Level element) {
              return PaddingVertical(
                20,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    '---- Chapter ${element.world.index} ---',
                    style: TS.t3.medium,
                  ),
                  const Gap(8),
                  SizedBox(
                    height: 64,
                    width: 64,
                    child: SpriteAnimationWidget.asset(
                      path: element.world.sprite.gPath,
                      data: SpriteAnimationData.sequenced(
                        amount: element.world.spriteAmount,
                        stepTime: 0.3,
                        textureSize: V2.all(element.world.spriteSize),
                      ),
                    ),
                  ),
                  const Gap(8),
                  Text(
                    element.world.name,
                    style: TS.t1.bold,
                  ),
                ]),
              );
            },
            itemBuilder: (context, level) {
              var isCleared = levelClearStorage.isCleared(level);
              var isMoveable =
                  isCleared || level.index == 1 || levelClearStorage.isCleared(Level.values[level.index - 1]);
              return ListTile(
                title: Text(
                  level.name,
                  style: TS.c(isMoveable ? C.onSurface : C.onSurface50),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    !isMoveable ? Icon(MdiIcons.lock) : null,
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isShowScore = true;
                          _fetchLevelRanking(level);
                        });
                      },
                      icon: Icon(MdiIcons.trophy),
                      tooltip: context.s.g_ranking,
                    )
                  ].whereNotNull().toList(),
                ),
                onTap: isMoveable
                    ? () {
                        manager.moveLevel(level);
                        Navigator.pop(context);
                      }
                    : null,
              );
            },
            groupSeparatorBuilder: (value) => const Divider(),
            stickyHeaderBackgroundColor: C.surface50,
            floatingHeader: true,
          ),
        ),
        IgnorePointer(
          ignoring: !_isShowScore,
          child: AnimatedOpacity(
              opacity: _isShowScore ? 1 : 0,
              duration: 500.ms,
              child: PopScope(
                canPop: false,
                onPopInvoked: (didPop) {
                  if (!didPop) setState(() => _isShowScore = false);
                },
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(selectedLevel.name),
                    backgroundColor: C.transparent,
                  ),
                  body: _isLoading
                      ? const LoadingState()
                      : _rankings.isEmpty
                          ? const EmptyState()
                          : ListView.builder(
                              itemCount: _rankings.length,
                              itemBuilder: (context, index) {
                                var score = _rankings[index];
                                return ListTile(
                                  title: Text('${index + 1}. ${score.name}'),
                                  subtitle: Text(
                                      '${(score.timeMs / 1000).toStringAsFixed(3)}ms / ${score.bounceCount}'),
                                );
                              },
                            ),
                ),
              )),
        ),
      ],
    );
  }
}
