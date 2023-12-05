import 'package:flutter_animate/flutter_animate.dart';

import '../../../export.dart';
import '../../main_game.dart';

class StageStartOverlay extends StatelessWidget {
  const StageStartOverlay({
    super.key,
    required this.overlayId,
    required this.stageName,
    required this.description,
  });

  final String overlayId, stageName, description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FullWidth(
        child: Container(
          decoration: BoxDecoration(border: (Colors.white30, 1).border),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [C.surface, C.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              PaddingVertical(
                24,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(stageName, style: TS.h1),
                    Text(description, style: TS.b1.bold.onSurface70),
                  ],
                ),
              ),
              const Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [C.surface, C.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate(
          onComplete: (controller) {
            di<MainGame>().overlays.remove(overlayId);
          },
        )
        .fadeIn()
        .slideY(begin: -0.05, end: 0)
        .then(delay: 2.seconds)
        .fadeOut()
        .slideY(end: -0.05);
  }
}
