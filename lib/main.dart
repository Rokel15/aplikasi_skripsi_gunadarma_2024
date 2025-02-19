import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/firebase_options.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/auth_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/dashboard_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/global_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/screens/dashboard_screen.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/screens/login_screen.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/screens/map_screen.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/screens/map_screen_type_2.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/screens/registration_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        ),
        ChangeNotifierProvider<DashboardProvider>(
          create: (context) => DashboardProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'shallot farming decision makers',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        initialRoute: "/login screen",
        routes: {
          "/login screen" : (BuildContext context) => const LoginScreen(),
          "/registration screen" : (BuildContext context) => const RegistrationScreen(),
          "/dashboard screen" : (BuildContext context) => const DashboardScreen(),
          "/map screen" : (BuildContext context) => const MapScreen(),
          "/map screen type 2" : (BuildContext context) => const MapScreenType2(),
        },
      ),
    );
  }
}