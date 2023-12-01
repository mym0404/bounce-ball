import 'package:flame/extensions.dart';

const _randomThumbnails = <String>[
  'https://iili.io/JCm0irv.png',
  'https://iili.io/JxVEs9V.png',
  'https://iili.io/JxVELAB.png',
  'https://iili.io/JxVWVb2.png',
  'https://iili.io/JxVWXxS.png',
  'https://iili.io/JxVWNfe.png',
  'https://iili.io/JxVWSOQ.png',
  'https://iili.io/JxVWs0g.png',
  'https://iili.io/JxVWbbp.png',
  'https://iili.io/JxVX2gs.png',
  'https://iili.io/JxVXFdG.png',
  'https://iili.io/JxVXqml.png',
  'https://iili.io/JxVXfe4.png',
  'https://iili.io/JxVXK7f.png',
  'https://iili.io/JxVXCI2.png',
  'https://iili.io/JxVXnXS.png',
  'https://iili.io/JxVXoL7.png',
  'https://iili.io/JxVXzB9.png',
  'https://iili.io/JxVXI1e.png',
  'https://iili.io/JxVXTru.png',
  'https://iili.io/JxVX7mQ.png',
  'https://iili.io/JxVXaIV.png',
  'https://iili.io/JxVXchB.png',
  'https://iili.io/JxVX1B1.png',
  'https://iili.io/JxVXEEF.png',
  'https://iili.io/JxVXGrg.png',
  'https://iili.io/JxVXV2a.png',
  'https://iili.io/JxVXWYJ.png',
];

class UserThumbnailUtil {
  UserThumbnailUtil._internal();
  factory UserThumbnailUtil() => UserThumbnailUtil._internal();

  String getRandomThumbnail() {
    return _randomThumbnails.random();
  }
}
