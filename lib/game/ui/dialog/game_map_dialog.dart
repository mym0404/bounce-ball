import 'package:flame/widgets.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../export.dart';
import '../../component/level/Level.dart';
import '../panel/score_ranking_panel.dart';
import '../widget/panel_header.dart';

class GameMapDialog extends StatefulWidget {
  const GameMapDialog({super.key});

  @override
  State<GameMapDialog> createState() => _GameMapDialogState();
}

class _GameMapDialogState extends State<GameMapDialog> {
  bool _isShowScore = false;
  Level selectedLevel = Level.lv00;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PanelHeader(
          title:
              _isShowScore ? '${selectedLevel.world.name} - ${selectedLevel.name}' : context.s.stage_dv_title,
          mode: _isShowScore ? PanelHeaderMode.back : PanelHeaderMode.close,
          onPress: () {
            if (_isShowScore) {
              setState(() => _isShowScore = false);
            } else {
              Navigator.maybePop(context);
            }
          },
        ),
        Expanded(
          child: Stack(
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
                    var isMoveable = isCleared ||
                        level.index == 1 ||
                        levelClearStorage.isCleared(Level.values[level.index - 1]);
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
                                selectedLevel = level;
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
                    child: ScoreRankingPanel(level: selectedLevel)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
