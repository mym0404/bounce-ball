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
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) => ListTile(
        title: Text('$index'),
      ),
    );
  }
}
