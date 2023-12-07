import 'package:flame/widgets.dart';

import '../../../export.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key, this.title, this.body});

  final String? title, body;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? context.s.g_loading_title,
            style: TS.t2.bold,
          ),
          const Gap(12),
          SizedBox(
            height: 256,
            width: 256,
            child: SpriteAnimationWidget.asset(
              path: img.planet.loading.gPath,
              data: SpriteAnimationData.sequenced(
                amount: 50,
                stepTime: 0.1,
                textureSize: V2.all(256),
              ),
            ),
          ),
          const Gap(8),
          Text(
            body ?? context.s.g_loading_body,
            style: TS.b3.bold.onSurface50,
          ),
        ],
      ),
    );
  }
}
