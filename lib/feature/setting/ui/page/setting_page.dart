import '../../../../export.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.settingTitle),
      ),
      body: ListView(
        children: const [],
      ),
    );
  }
}
