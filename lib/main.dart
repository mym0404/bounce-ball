import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'export.dart';
import 'service/bootstrap/boot_strap.dart';

void main() async {
  var binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  await bootStrap();
}

/*
1. 매 스테이지마다 (죽은횟수, 깬 시간, 튀긴 횟수를 합산하여) 스코어 계산후 랭킹
2. 매 스테이지마다 친구와 같이 플레이할수있도록 멀티플레이
3. 리셋기능
4. 자기가 깬거 스테이지 및 점수 저장 기능
5. 앱스토어, 플레이스토어 출시
6. SEO
7. 다른 추가 블록들, 스킬들
8. 공 커스터마이징
 */
