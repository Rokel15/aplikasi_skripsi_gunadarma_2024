import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/auth_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/registration_screen/app_icon.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/registration_screen/form_registration_input.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/registration_screen/registration_button.dart';
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
            leading: GestureDetector(
              child: const Icon(Icons.arrow_back, color: Colors.white,),
              onTap: (){authProvider.cancelRegistration(context);},
            ),
            title: Text(
              "Registration",
              style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
            ),
            backgroundColor: Provider.of<GlobalProvider>(context, listen: false).mainColor,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcon(image: Provider.of<GlobalProvider>(context, listen: false).appIcon,),

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

                  const SizedBox(height: 24,),

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

                  const SizedBox(height: 24,),

                  FormRegistrationInput(
                    textEditingController: authProvider.confirmPasswordRegistController,
                    obscureText: authProvider.visibleConfirmPasswordRegist==false?
                    authProvider.confirmPasswordRegistObsecureTextTrue :
                    authProvider.confirmPasswordRegistObsecureText,
                    hintLabel: authProvider.confirmPasswordRegistLabel,
                    hintText: authProvider.confirmPasswordRegistHint,
                    suffixIcon: authProvider.visibleConfirmPasswordRegist==false?
                    authProvider.showPasswordOffIcon :
                    authProvider.showPasswordOnIcon,
                    onTapSuffixIcon: (){authProvider.showConfirmPasswordRegist();},
                    borderColor: authProvider.borderColor,
                  ),

                  const SizedBox(height: 28,),

                  RegistrationButton(
                    textButton: authProvider.textRegistrationButton,
                    textStyle: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
                    buttonColor: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                    onTapRegist: () => authProvider.register(context),
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