import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  static void delAll() async {
    QuerySnapshot search = await Firestore.instance
        .collection('todo')
        .where('done', isEqualTo: true)
        .getDocuments();

    search.documents.forEach((e) => FireStore.delonce(e.documentID));
  }
  static void delonce(String id) {
    final DocumentReference ref =
        Firestore.instance.document('todo/' + id);
    Firestore.instance.runTransaction((Transaction i) async {
      DocumentSnapshot shot = await i.get(ref);
      if (shot.exists) {
        await i.delete(ref);
      }
    });
  }
  static void addTodo(String id) {
    Firestore.instance
        .collection('todo')
        .document()
        .setData({'title': id, 'done': false});
  }
  static void update(String id, bool val) {
    final DocumentReference ref = Firestore.instance.document('todo/' + id);
    Firestore.instance.runTransaction((Transaction i) async {
      DocumentSnapshot shot = await i.get(ref);
      if (shot.exists) {
        await i.update(ref, <String, dynamic>{'done': val});
      }
    });
  }
}