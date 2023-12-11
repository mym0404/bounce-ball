import 'package:signature/signature.dart';

import '../../../export.dart';
import '../../component/level/Level.dart';
import '../../network/score_repository.dart';
import '../../state/score_schema.dart';
import '../widget/panel_header.dart';

class RankingRegisterDialog extends StatefulWidget {
  const RankingRegisterDialog({
    super.key,
    required this.score,
    required this.level,
  });

  final Level level;
  final ScoreSchema score;

  @override
  State<RankingRegisterDialog> createState() => _RankingRegisterDialogState();
}

class _RankingRegisterDialogState extends State<RankingRegisterDialog> {
  var isLoading = false;

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: C.white,
    exportBackgroundColor: C.transparent,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (_controller.isEmpty) {
      context.showWarningSnackBar(text: context.s.e_empty_signature);
      return;
    }
    setState(() => isLoading = true);
    context.showInfoSnackBar(text: context.s.register_ranking_start);

    try {
      await ScoreRepository().saveRecord(
        level: widget.level,
        score: widget.score,
        signaturePoints: _controller.points,
      );
      context.showSuccessSnackBar(text: context.s.register_ranking_done);
    } catch (e) {
      log.e(e);
      context.showErrorSnackBar(text: context.s.g_error);
    }
    setState(() => isLoading = false);
    Navigator.maybePop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cont) {
        var height = cont.maxHeight;
        double signatureCanvasSize = max(100, min(height - 300, 300));
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PanelHeader(title: context.s.register_ranking),
            const Gap(20),
            Text(context.s.register_ranking_body),
            const Gap(20),
            Container(
              width: signatureCanvasSize,
              height: signatureCanvasSize,
              decoration: BoxDecoration(border: (C.onSurface30, 1).border),
              child: Signature(
                controller: _controller,
                width: signatureCanvasSize,
                height: signatureCanvasSize,
                backgroundColor: C.surface,
              ),
            ),
            const Gap(24),
            TextButton.icon(
              icon: Icon(MdiIcons.trashCan),
              onPressed: () => _controller.clear(),
              label: Text(context.s.g_clear),
            ),
            const Gap(24),
            FilledButton.tonal(
                onPressed: isLoading ? null : _register, child: Text(context.s.register_ranking)),
            const Gap(12),
            TextButton(onPressed: () => Navigator.maybePop(context), child: Text(context.s.g_cancel)),
          ],
        );
      },
    );
  }
}
