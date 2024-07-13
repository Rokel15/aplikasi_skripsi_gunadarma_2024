import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/auth_service.dart';

class AuthProvider extends ChangeNotifier{
  Color borderColor = const Color(0xff51AB8C);
  Color loginButtonColor = const Color(0xff51AB8C);

  bool emailObscureText = false;
  String emailLabel = "Email";
  String emailHint = "input email";
  TextEditingController emailController = TextEditingController();
  Icon emailIcon = const Icon(Icons.email_outlined);

  bool passwordObscureTextTrue = true;
  bool passwordObscureText = false;
  String passwordLabel = "Password";
  String passwordHint = "input password";
  TextEditingController passwordController = TextEditingController();
  bool visiblePassword = false;
  Icon showPasswordOnIcon = const Icon(Icons.visibility);
  Icon showPasswordOffIcon = const Icon(Icons.visibility_off);

  void showPassword(){
    if(visiblePassword==false){
      visiblePassword = true;
      notifyListeners();
    } else if(visiblePassword==true){
      visiblePassword=false;
      notifyListeners();
    }
    notifyListeners();
  }

  String textLoginButton = "Login";
  String registOfferText = "you don't have account yet? ";
  String textForRegist = "register";

  void login(BuildContext context)async{
    bool success = await AuthService().signIn(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );

    if(success) {
      Navigator.pushReplacementNamed(context, "/dashboard screen");
      notifyListeners();
    }

    notifyListeners();
  }

  // Future<void> signIn(BuildContext context)async {
  //   try{
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //     const CircularProgressIndicator();
  //     // await Future.delayed(const Duration(seconds: 2));
  //     Navigator.pushReplacementNamed(context, "/dashboard screen");
  //     notifyListeners();
  //   }
  //   on FirebaseAuthException catch(e){
  //     String message = "wrong password or no user found";
  //     // if(e.code == 'user-not-found'){
  //     //   message = "No user found for that email";
  //     // } else if(e.code == 'wrong-password'){
  //     //   message = "Wrong password provided for that user";
  //     // }
  //     Fluttertoast.showToast(
  //       msg: e.toString(),
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.SNACKBAR,
  //       backgroundColor: Colors.black54,
  //       textColor: Colors.white,
  //     );
  //     notifyListeners();
  //   }
  //   // catch (e) {
  //   //   Fluttertoast.showToast(
  //   //     msg: "An unexpected error occurred",
  //   //     toastLength: Toast.LENGTH_LONG,
  //   //     gravity: ToastGravity.SNACKBAR,
  //   //     backgroundColor: Colors.black54,
  //   //     textColor: Colors.white,
  //   //   );
  //   // }
  // }

  void goToRegistrationScreen(BuildContext context) async{
    Navigator.pushNamed(context, "/registration screen");
    notifyListeners();
  }

  bool emailRegistObsecureText = false;
  String emailRegistLabel = "Email";
  String emailRegistHint = "input email";
  TextEditingController emailRegistController = TextEditingController();

  bool passwordRegistObsecureTextTrue = true;
  bool passwordRegistObsecureText = false;
  String passwordRegistLabel = "Password";
  String passwordRegistHint = "input password";
  TextEditingController passwordRegistController = TextEditingController();
  bool visiblePasswordRegist = false;

  void showPasswordRegist(){
    if(visiblePasswordRegist==false){
      visiblePasswordRegist = true;
      notifyListeners();
    } else if(visiblePasswordRegist==true){
      visiblePasswordRegist=false;
      notifyListeners();
    }
    notifyListeners();
  }

  bool confirmPasswordRegistObsecureTextTrue = true;
  bool confirmPasswordRegistObsecureText = false;
  String confirmPasswordRegistLabel = "Password";
  String confirmPasswordRegistHint = "input password";
  TextEditingController confirmPasswordRegistController = TextEditingController();
  bool visibleConfirmPasswordRegist = false;

  void showConfirmPasswordRegist(){
    if(visibleConfirmPasswordRegist==false){
      visibleConfirmPasswordRegist = true;
      notifyListeners();
    } else if(visibleConfirmPasswordRegist==true){
      visibleConfirmPasswordRegist = false;
      notifyListeners();
    }
    notifyListeners();
  }

  String textRegistrationButton = "Register";

  SnackBar snackBarMessagePasswordNotTheSame = const SnackBar(content: Text("confirm password is not the same"));
  SnackBar snackBarMessagePasswordEmpty = const SnackBar(content: Text("password can not be empty"));

  void cancelRegistration(BuildContext context){
    Navigator.popAndPushNamed(context, "/login screen");
    notifyListeners();
  }

  void register(BuildContext context) async{
    if(passwordRegistController.text == confirmPasswordRegistController.text){
      try{
        await AuthService().signUp(
          email: emailRegistController.text,
          password: passwordRegistController.text,
        );
        Navigator.popAndPushNamed(context, "/login screen");
        notifyListeners();
      }catch(e){
        rethrow;
      }
      notifyListeners();
    }

    if(passwordRegistController.text != confirmPasswordRegistController.text){
      ScaffoldMessenger.of(context).showSnackBar(snackBarMessagePasswordNotTheSame);
      notifyListeners();
    }

    if(passwordRegistController.text == ""){
      ScaffoldMessenger.of(context).showSnackBar(snackBarMessagePasswordEmpty);
      notifyListeners();
    } else if(confirmPasswordRegistController.text == ""){
      ScaffoldMessenger.of(context).showSnackBar(snackBarMessagePasswordEmpty);
      notifyListeners();
    } else {
      Navigator.popAndPushNamed(context, "/login screen");
      notifyListeners();
    }
    notifyListeners();
  }
}