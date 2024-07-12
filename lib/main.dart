import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/auth_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/global_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/screens/login_screen.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/screens/registration_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalProvider>(
          create: (context) => GlobalProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        title: 'shallot farming decision makers',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: "/login screen",
        routes: {
          "/login screen" : (BuildContext context) => const LoginScreen(),
          "/registration screen" : (BuildContext context) => const RegistrationScreen(),
        },
      ),
    );
  }
}