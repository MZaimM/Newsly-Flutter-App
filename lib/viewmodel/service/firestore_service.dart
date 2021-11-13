import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _reference = _firestore.collection('articles');

class FirestoreService {
  static Future<void> addItem(
      {required String title,
      required String author,
      required String published,
      required String urlArticle,
      required String description,
      required String image,
      required String id}) async {
    DocumentReference documentReferencer = _reference.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "author": author,
      "published": published,
      "url": urlArticle,
      "description": description,
      "image": image,
      "id" : id
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Data Artikel berhasil Ditambahkan"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference readReference = _reference;
    return readReference.snapshots();
  }

  static Future<void> updateItem(
      {required String title,
      required String author,
      required String published,
      required String urlArticle,
      required String description,
      required String id, required String image}) async {
    await Firebase.initializeApp();
    DocumentReference documentReferencer = _reference.doc(id);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "author": author,
      "published": published,
      "url": urlArticle,
      "description": description,
      "image" : image
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Data Artikel berhasil Diupdate"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem({required String id}) async {
    DocumentReference documentReference = _reference.doc(id);

    await documentReference
        .delete()
        .whenComplete(() => print("Data berhasil dihapus"))
        .catchError((e) => print("Data gagal dihapus"));
  }
}
