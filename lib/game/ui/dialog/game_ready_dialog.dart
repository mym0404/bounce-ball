import 'package:flutter_animate/flutter_animate.dart';

import '../../../export.dart';

class GameReadyDialog extends StatefulWidget {
  const GameReadyDialog({super.key});

  @override
  State<GameReadyDialog> createState() => _GameReadyDialogState();
}

class _GameReadyDialogState extends State<GameReadyDialog> {
  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      500.ms.runAfter(_pressStart);
    }
  }

  void _pressStart() {
    manager.startGame();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.s.app_name,
            style: TS.titleLarge,
          ),
          const Gap(12),
          Text(context.s.ready_dv_description, textAlign: TextAlign.center),
          const Gap(12),
          img.logo1024
              .image(width: 128)
              .animate()
              .blur(duration: 2.seconds, end: Offset.zero, begin: const Offset(12, 12)),
          const Gap(12),
          FilledButton.tonal(
            onPressed: _pressStart,
            child: Text(context.s.g_start),
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
