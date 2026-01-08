import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> addNewUser({
    required String name,
    required String emailOrNum,
    required String pass,
    required String uuid,
    required void Function() sucess,
    required void Function() onError,
  }) async {
    await db
        .collection("user")
        .doc()
        .set({"name": name, "emailOrNum": emailOrNum, "pass": pass})
        .then((value) {
          sucess();
        })
        .onError((error, stackTrace) {
          onError();
        });
  }
}
