import 'package:flutter_animate/flutter_animate.dart';

import '../../export.dart';

class GameReadyOverlay extends StatefulWidget {
  const GameReadyOverlay({super.key});

  @override
  State<GameReadyOverlay> createState() => _GameReadyOverlayState();
}

class _GameReadyOverlayState extends State<GameReadyOverlay> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Bounce Ball',
            style: TS.titleLarge,
          ),
          const Gap(12),
          const Text('Bounce your ball\nReach the Goal', textAlign: TextAlign.center),
          const Gap(12),
          img.logo1024
              .image(width: 128)
              .animate()
              .blur(duration: 2.seconds, end: Offset.zero, begin: const Offset(12, 12)),
          const Gap(12),
          FilledButton.tonal(
            onPressed: () {
              manager.startGame();
              Navigator.pop(context);
            },
            child: const Text('Start'),
          ),
          const Gap(12),
          Text(
            'MJ Studio',
            style: TS.l3.onSurface50,
          ),
        ],
      ),
    );
  }
}
