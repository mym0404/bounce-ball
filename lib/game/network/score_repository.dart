import 'package:cloud_firestore/cloud_firestore.dart';

import '../component/level/Level.dart';
import '../state/score_schema.dart';

class ScoreRepository {
  ScoreRepository._internal();
  factory ScoreRepository() => ScoreRepository._internal();

  FirebaseFirestore get db => FirebaseFirestore.instance;

  Future<void> saveRecord({required Level level, required ScoreSchema score, required String name}) async {
    await db.collection('scores/${level.id}').add({...score.toJson(), name: name});
  }
}
