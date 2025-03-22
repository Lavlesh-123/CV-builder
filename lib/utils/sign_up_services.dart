import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

signUpUser(String userName, String userNumber, String userEmail,String userPassword) async {

  User? userid = FirebaseAuth.instance.currentUser;

  await FirebaseFirestore.instance.collection('users').doc(userid!.uid).set({
    'userName': userName,
    'userNumber': userNumber,
    'userEmail': userEmail,
    'userPassword': userPassword,
    'createdAt': DateTime.now(),
    'userId': userid!.uid,
  });
}
