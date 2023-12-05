import 'package:flame/widgets.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../export.dart';
import '../../component/level/Level.dart';

class GameMapDialog extends StatelessWidget {
  const GameMapDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupedListView(
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
          trailing: !isMoveable ? Icon(MdiIcons.lock) : null,
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
    );
  }
}
