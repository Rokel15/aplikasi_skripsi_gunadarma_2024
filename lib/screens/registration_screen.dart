import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/auth_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/registration_screen/form_registration_input.dart';
import '../providers/global_provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Provider.of<GlobalProvider>(context, listen: false).mainColor,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2.6,
                    height: MediaQuery.of(context).size.height*3/12,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        Provider.of<GlobalProvider>(context, listen: false).appIcon,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),

                  FormRegistrationInput(
                    textEditingController: authProvider.emailRegistController,
                    obscureText: authProvider.emailRegistObsecureText,
                    hintLabel: authProvider.emailRegistLabel,
                    hintText: authProvider.emailRegistHint,
                    suffixIcon: authProvider.emailIcon,
                    onTapSuffixIcon: (){},
                    borderColor: authProvider.borderColor,
                  ),

                  const SizedBox(height: 20,),

                  FormRegistrationInput(
                    textEditingController: authProvider.passwordRegistController,
                    obscureText: authProvider.visiblePasswordRegist==false?
                    authProvider.passwordRegistObsecureTextTrue :
                    authProvider.passwordRegistObsecureText,
                    hintLabel: authProvider.passwordRegistLabel,
                    hintText: authProvider.passwordRegistHint,
                    suffixIcon: authProvider.visiblePasswordRegist==false?
                    authProvider.showPasswordOffIcon :
                    authProvider.showPasswordOnIcon,
                    onTapSuffixIcon: (){authProvider.showPasswordRegist();},
                    borderColor: authProvider.borderColor,
                  ),

                  const SizedBox(height: 20,),

                  //for confirm password
                  FormRegistrationInput(
                    textEditingController: authProvider.passwordRegistController,
                    obscureText: authProvider.visiblePasswordRegist==false?
                    authProvider.passwordRegistObsecureTextTrue :
                    authProvider.passwordRegistObsecureText,
                    hintLabel: authProvider.passwordRegistLabel,
                    hintText: authProvider.passwordRegistHint,
                    suffixIcon: authProvider.visiblePasswordRegist==false?
                    authProvider.showPasswordOffIcon :
                    authProvider.showPasswordOnIcon,
                    onTapSuffixIcon: (){authProvider.showPasswordRegist();},
                    borderColor: authProvider.borderColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}