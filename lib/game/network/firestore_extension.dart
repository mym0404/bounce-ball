import 'package:cloud_firestore/cloud_firestore.dart';

import '../../export.dart';

extension FBExtension<T extends Object?> on Future<QuerySnapshot<T>> {
  Future<List<Y>> map<Json, Y>(Y Function(Json) callback) => then((value) {
        return value.docs.map<Y>((e) => callback(e.data() as Json)).toList();
      });
}
