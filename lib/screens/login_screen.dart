import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/auth_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/global_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/login_screen/form_login_input.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/login_screen/login_button.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/login_screen/registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(
                backgroundColor: Provider.of<GlobalProvider>(context, listen: false).mainColor,
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/2.3,
                      height: MediaQuery.of(context).size.height*3/10,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          Provider.of<GlobalProvider>(context, listen: false).appIcon,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    const SizedBox(height: 76,),

                    FormLoginInput(
                      textEditingController: authProvider.emailController,
                      obscureText: authProvider.passwordObscureText,
                      hintLabel: authProvider.emailLabel,
                      hintText: authProvider.emailHint,
                      suffixIcon: authProvider.emailIcon,
                      onTapSuffixIcon: (){},
                      borderColor: authProvider.borderColor,
                    ),

                    const SizedBox(height: 30,),

                    FormLoginInput(
                      textEditingController: authProvider.passwordController,
                      obscureText: authProvider.visiblePassword==false?
                      authProvider.passwordObscureTextTrue:
                      authProvider.passwordObscureText,
                      hintLabel: authProvider.passwordLabel,
                      hintText: authProvider.passwordHint,
                      suffixIcon: authProvider.visiblePassword==false?
                      authProvider.showPasswordOffIcon :
                      authProvider.showPasswordOnIcon,
                      onTapSuffixIcon: () => authProvider.showPassword(),
                      borderColor: authProvider.borderColor,
                    ),

                    const SizedBox(height: 30,),

                    LoginButton(
                      textButton: authProvider.textButton,
                      textStyle: Provider.of<GlobalProvider>(context, listen: false).whiteRoboto16Bold,
                      buttonColor: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                    ),

                    const SizedBox(height: 20,),

                    Registration(
                      registOfferText: authProvider.registOfferText,
                      textForRegist: authProvider.textForRegist,
                      textStyle: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
                      registerTextStyle: Provider.of<GlobalProvider>(context, listen: false).greenRoboto16Bold,
                      onTapTextForRegist: () => authProvider.goToRegistrationScreen(context),
                    )
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}