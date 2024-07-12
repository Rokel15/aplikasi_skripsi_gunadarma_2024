import 'package:flutter/material.dart';

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

  String textButton = "Login";
  String registOfferText = "you don't have account yet? ";
  String textForRegist = "register";

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
}