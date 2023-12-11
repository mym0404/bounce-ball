import 'package:flame/widgets.dart';

import '../../../export.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cont) {
        var height = cont.maxHeight;
        double length = height - 150 >= 256 ? 256 : 128;
        if (height <= 100) {
          return Center(
            child: Text(
              context.s.g_empty_title,
              style: TS.t2.bold,
            ),
          );
        }
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.s.g_empty_title,
                style: TS.t2.bold,
              ),
              const Gap(12),
              SizedBox(
                height: length,
                width: length,
                child: SpriteAnimationWidget.asset(
                  path: img.planet.empty.gPath,
                  data: SpriteAnimationData.sequenced(
                    amount: 50,
                    stepTime: 0.1,
                    textureSize: V2.all(256),
                  ),
                ),
              ),
              const Gap(8),
              Text(
                context.s.g_empty_body,
                style: TS.b3.bold.onSurface50,
              ),
            ],
          ),
        );
      },
    );
  }
}
