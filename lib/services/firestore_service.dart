import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
CollectionReference collectionReference = firebaseFirestore.collection("fields");