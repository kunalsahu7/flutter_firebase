import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseHelper {
  static FirebaseHelper firebaseHelper = FirebaseHelper._();

  FirebaseHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> Singup({required email, required password}) async {
    String msg = "";

    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => msg = "Success")
        .catchError((e) => msg = "Faild $e");
    return msg;
  }

  Future<String> SingIn({required email, required password}) async {
    return await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print("succes Login");
      return "success";
    }).catchError((e) {
      return "failed";
    });
  }

  Future<String> checkLogin() async {
    User? user = await firebaseAuth.currentUser;
    String uid = user!.uid;
    return uid;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String> signInWithGoogle() async {
    String? msg;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => msg = "Success")
        .catchError((e) => msg = "$e");
    return msg!;
  }

  Future<void> userdata() async {
    User? user = await firebaseAuth.currentUser;
  }

  Future<void> AddData({
    String? name,
    String? notes,
    String? price,
    String? review,
    String? warranty,
    String? paytypes,
    String? modelno,
    image,
  }) async {
    await firestore.collection("product").add({
      "name": name,
      "notes": notes,
      "price": price,
      "review": review,
      "warranty": warranty,
      "paytypes": paytypes,
      "modelno": modelno,
      "image":image
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readdata() {
    return firestore.collection("product").snapshots();
  }

  void UpdateData({
    String? key,
   required String? name,
    required String? notes,
    required String? price,
    required String? review,
    required String? warranty,
    required String? paytypes,
    required String? modelno,
    required image,
  }) {

    print(key);
    firestore.collection("product").doc("$key").set({
      "name": name,
      "notes": notes,
      "price":price,
      "review": review,
      "warranty": warranty,
      "paytypes": paytypes,
      "modelno": modelno,
      "image":image
    },);
  }

  Future<void> deletdata({required key})
  async {
    return await firestore.collection("product").doc(key).delete();
  }
}
