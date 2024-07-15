import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/dashboard_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/dashboard_screen/user_data.dart';
import '../providers/global_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, child) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop){
            dashboardProvider.logout(context);
          },
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(
                backgroundColor: Provider.of<GlobalProvider>(context, listen: false).mainColor,
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40,),

                      UserData(
                        profileIcon: dashboardProvider.profileIcon,
                        email: dashboardProvider.email,
                        uid: dashboardProvider.uid,
                        emailTextStyle: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
                        uidTextStyle: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                      ),

                      const SizedBox(height: 40,),

                      ElevatedButton(onPressed: (){}, child: Text("log out"))
                    ],
                  ),
                ),),
            ),
            backgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}