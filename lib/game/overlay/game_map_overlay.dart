import 'package:grouped_list/grouped_list.dart';

import '../../export.dart';
import '../component/level/Level.dart';

class GameMapOverlay extends StatelessWidget {
  const GameMapOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupedListView(
      elements: Level.allLevels,
      groupBy: (Level e) => e.world.index,
      groupHeaderBuilder: (Level element) {
        return PaddingVertical(
          20,
          child: Container(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(element.world.name),
            ]),
          ),
        );
      },
      itemBuilder: (context, element) {
        return ListTile(title: Text(element.name));
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
