import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService{
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> signUp({
    required String email,
    required String password,
  })async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch(e){
      String message = "";
      if(e.code == 'weak-password'){
        message = "The Password Provided Is Too Weak";
      } else if(e.code == 'email-already-in-use'){
        message = "An account already exists with that email";
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
      );
    }
    catch(e){
      rethrow;
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
    required BuildContext context,
  })async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    }
    on FirebaseAuthException catch(e){
      // String message = "";
      // if(e.code == 'user-not-found'){
      //   message = "No user found for that email";
      // } else if(e.code == 'wrong-password'){
      //   message = "Wrong password provided for that user";
      // }
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
      );
      return false;
    }
  }

  Future<void> signOut({
    required BuildContext context,
  }) async{
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
  }
}