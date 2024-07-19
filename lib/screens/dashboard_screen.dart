import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/models/open_weather_model.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/models/visual_crossing_model.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/dashboard_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/open_weather_service.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/dashboard_screen/user_data.dart';
import '../providers/global_provider.dart';
import '../services/visual_crossing_service.dart';

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

                      const SizedBox(height: 20,),

                      SizedBox(
                        width: double.infinity,
                        child: StreamBuilder(
                          stream: dashboardProvider.locationService.locationStream,
                          builder: (_, snapshot){
                            if(snapshot.hasData){
                              dashboardProvider.setLocation(latitude: snapshot.data!.latitude, longitude: snapshot.data!.longitude);
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Lt = ${snapshot.data?.latitude}"),
                                  const SizedBox(width: 20,),
                                  Text("Lng = ${snapshot.data?.longitude}"),
                                ],
                              );
                            } else {
                              return const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Lt = waiting..."),
                                  SizedBox(width: 20,),
                                  Text("Lng = waiting..."),
                                ],
                              );
                            }
                          },
                        ),
                      ),

                      const SizedBox(height: 20,),

                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          border: Border(top: BorderSide(color: Colors.black, width: 2)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 24,),

                            StreamBuilder<OpenWeatherModel>(
                              stream: dashboardProvider.fetchWeatherData(),
                              builder: (_, snapshot) {
                                if (snapshot.hasError) {
                                  return Center(child: Text('Error: ${snapshot.error}'));
                                } else if (snapshot.hasData) {
                                  OpenWeatherModel weatherData = snapshot.data!;
                                  return Column(
                                    children: [
                                      Text(weatherData.coord.lat.toString()),
                                      Text(weatherData.coord.lon.toString()),

                                      Column(
                                        children: weatherData.weather.map((weather) => Text(weather.main)).toList(),
                                      ),

                                      Column(
                                        children: weatherData.weather.map((weather) => Text(weather.icon)).toList(),
                                      ),

                                      Text("Weather COD: ${weatherData.cod}"),
                                    ],
                                  );
                                } else {
                                  return const Text("no data");
                                }
                              },
                            ),

                            Text("${dashboardProvider.latitude}"),
                            Text("${dashboardProvider.longitude}"),
                          ],
                        ),
                      ),

                      ElevatedButton(onPressed: (){}, child: const Text("log out"))
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