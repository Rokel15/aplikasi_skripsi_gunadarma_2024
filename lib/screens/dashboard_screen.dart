import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/models/location_model.dart';
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

                      const SizedBox(height: 20,),

                      StreamBuilder<LocationModel>(
                        stream: dashboardProvider.locationService.locationStream,
                        builder: (context, snapshot) {
                          if(snapshot.hasData){
                            LocationModel locationData = snapshot.data!;
                            dashboardProvider.setLocation(
                              latitude: locationData.latitude,
                              longitude: locationData.longitude,
                            );
                            return Column(
                              children: [
                                Text("latitude : ${locationData.latitude}"),
                                Text("longitude : ${locationData.longitude}"),
                              ],
                            );
                          } else{
                            return Container();
                          }
                        },
                      ),

                      const SizedBox(height: 20,),

                      Text("latitude : ${dashboardProvider.latitude}"),
                      Text("longitude : ${dashboardProvider.longitude}"),

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

                            if(dashboardProvider.isLoading)
                              const Center(child: CircularProgressIndicator(),)
                            else if(dashboardProvider.weatherData != null)
                              Column(
                                children: [
                                  Text("lat ${dashboardProvider.weatherData!.coord.lat}"),
                                  Text("lon ${dashboardProvider.weatherData!.coord.lon}"),
                                  Column(
                                    children: dashboardProvider.weatherData!.weather.map((weather) => Text("main : ${weather.main}")).toList(),
                                  ),
                                  Column(
                                    children: dashboardProvider.weatherData!.weather.map((weather) => Text("description : ${weather.description}")).toList(),
                                  ),
                                  Text("base : ${dashboardProvider.weatherData!.base}"),
                                  Text("main temp : ${dashboardProvider.weatherData!.main.temp}"),
                                  Text("main feels like : ${dashboardProvider.weatherData!.main.feelsLike}"),
                                  Text("main humidity : ${dashboardProvider.weatherData!.main.humidity}"),
                                  Text("visibility : ${dashboardProvider.weatherData!.visibility}"),
                                  Text("wind speed : ${dashboardProvider.weatherData!.wind.speed}"),
                                  Text("sys id : ${dashboardProvider.weatherData!.sys.id}"),
                                  Text("sys country : ${dashboardProvider.weatherData!.sys.country}"),
                                  Text("name : ${dashboardProvider.weatherData!.name}"),
                                  Text("Weather COD: ${dashboardProvider.weatherData!.cod}"),
                                ],
                              )
                            else
                              const Text("No data available"),

                            // FutureBuilder(
                            //   future: OpenWeatherService().getWeather(
                            //     lat: dashboardProvider.latitude.toString(),
                            //     lon: dashboardProvider.longitude.toString(),
                            //   ),
                            //   builder: (_, snapshot) {
                            //     if (snapshot.hasError) {
                            //       return Text("Error: ${snapshot.error}");
                            //     } else if (!snapshot.hasData || snapshot.data == null) {
                            //       return const Text("No data available");
                            //     } else {
                            //       OpenWeatherModel weatherData = snapshot.data!;
                            //       return Column(
                            //         children: [
                            //           Text("lat ${weatherData.coord.lat}"),
                            //           Text("lon ${weatherData.coord.lon}"),
                            //           Column(
                            //             children: weatherData.weather.map((weather) => Text("main : ${weather.main}")).toList(),
                            //           ),
                            //           Column(
                            //             children: weatherData.weather.map((weather) => Text("description : ${weather.description}")).toList(),
                            //           ),
                            //           Text("base : ${weatherData.base}"),
                            //           Text("main temp : ${weatherData.main.temp}"),
                            //           Text("main feels like : ${weatherData.main.feelsLike}"),
                            //           Text("main humidity : ${weatherData.main.humidity}"),
                            //           Text("visibility : ${weatherData.visibility}"),
                            //           Text("wind speed : ${weatherData.wind.speed}"),
                            //           Text("sys id : ${weatherData.sys.id}"),
                            //           Text("sys country : ${weatherData.sys.country}"),
                            //           Text("name : ${weatherData.name}"),
                            //           Text("Weather COD: ${weatherData.cod}"),
                            //         ],
                            //       );
                            //     }
                            //   },
                            // ),

                            ElevatedButton(
                              onPressed: () => dashboardProvider.fetchWeatherData(),
                              child: const Text("Load Data"),
                            ),
                          ],
                        ),
                      ),
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