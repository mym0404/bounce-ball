import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signature/signature.dart';

import '../component/level/Level.dart';
import '../state/score_schema.dart';
import 'firestore_extension.dart';

class ScoreRepository {
  ScoreRepository._internal();
  factory ScoreRepository() => ScoreRepository._internal();

  FirebaseFirestore get db => FirebaseFirestore.instance;

  Future<void> saveRecord(
      {required Level level, required ScoreSchema score, required List<Point> signaturePoints}) async {
    await getLevelRef(level).add(score.copyWith(signaturePoints: signaturePoints).toJson());
  }

  Future<List<ScoreSchema>> listRecordByTime({required Level level}) async {
    return getLevelRef(level).orderBy('timeMs').limit(50).get().map(ScoreSchema.fromJson);
  }

  Future<List<ScoreSchema>> listRecordByBounce({required Level level}) async {
    return getLevelRef(level).orderBy('bounceCount').limit(50).get().map(ScoreSchema.fromJson);
  }

  CollectionReference getLevelRef(Level level) => db.collection('rankings_${level.id}');
}
