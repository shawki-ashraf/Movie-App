import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String collectionName;

  FirestoreService(this.collectionName);

  CollectionReference get _collection => _firestore.collection(collectionName);

  Stream<QuerySnapshot> getStream() {
    return _collection.snapshots();
  }

  Future<void> add(Map<String, dynamic> data) async {
    await _collection.add(data);
  }

  Future<void> update(String docId, Map<String, dynamic> data) async {
    await _collection.doc(docId).update(data);
  }

  Future<void> delete(String docId) async {
    await _collection.doc(docId).delete();
  }
}
