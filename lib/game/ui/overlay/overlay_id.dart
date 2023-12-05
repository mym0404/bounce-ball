import '../../../export.dart';
import '../../main_game.dart';

enum OverlayId {
  stageStart,
  ;

  Widget Function(BuildContext, MainGame) get builder => switch (this) {
        OverlayId.stageStart => (context, game) => const Empty(),
      };
}
