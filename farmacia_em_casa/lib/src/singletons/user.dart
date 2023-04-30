import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSingleton {
  String id;
  String paymentId;
  String authId;

  UserSingleton(this.id, this.paymentId, this.authId);

  factory UserSingleton.empty() => UserSingleton("", "", "");


  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  
}
