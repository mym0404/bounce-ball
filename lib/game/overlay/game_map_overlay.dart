import 'package:flame/widgets.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../export.dart';
import '../component/level/Level.dart';

class GameMapOverlay extends StatelessWidget {
  const GameMapOverlay({super.key});

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
                  textureSize: V2.all(128),
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
        return ListTile(
          title: Text(
            level.name,
            style: TS.c(isCleared ? C.onSurface : C.onSurface50),
          ),
          trailing: !isCleared ? Icon(MdiIcons.lock) : null,
          onTap: isCleared ? () {} : null,
        );
      },
      groupSeparatorBuilder: (value) => const Divider(),
      stickyHeaderBackgroundColor: C.surface50,
      useStickyGroupSeparators: true,
    );
  }
}
