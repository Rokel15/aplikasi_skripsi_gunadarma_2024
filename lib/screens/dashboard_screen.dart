import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/models/location_model.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/dashboard_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/dashboard_screen/user_info.dart';
import '../providers/global_provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    // Provider.of<DashboardProvider>(context, listen: false).fetchWeatherData();
    Provider.of<DashboardProvider>(context, listen: false).getWeatherData();
    super.initState();
  }

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
                      color: Colors.black
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 28,),

                      UserInfo(
                        containerColor: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                        profileIcon: dashboardProvider.profileIcon,
                        email: dashboardProvider.email,
                        uid: dashboardProvider.uid,
                        emailTextStyle: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
                        uidTextStyle: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                        lat: dashboardProvider.longitude.toString(),
                        lon: dashboardProvider.longitude.toString(),
                        latLonTextStyle: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                      ),

                      StreamBuilder<LocationModel>(
                        stream: dashboardProvider.locationService.locationStream,
                        builder: (context, snapshot) {
                          if(snapshot.hasData){
                            LocationModel locationData = snapshot.data!;
                            dashboardProvider.setLocation(
                              latitude: locationData.latitude,
                              longitude: locationData.longitude,
                            );
                            return Container(
                              // margin: const EdgeInsets.symmetric(horizontal: 28),
                              // child: Column(
                              //   children: [
                              //     Container(),
                                  // Text("lat : ${locationData.latitude}"),
                                  // Text("lon : ${locationData.longitude}"),
                              //   ],
                              // ),
                            );
                          } else{
                            return Container(
                            //   margin: const EdgeInsets.symmetric(horizontal: 28),
                            //   child: const Column(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       Text("lat : waiting..."),
                            //       Text("lon : waiting..."),
                            //     ],
                            //   ),
                            );
                          }
                        },
                      ),

                      const SizedBox(height: 24,),

                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44),
                          ),
                          border: Border(
                            top: BorderSide(
                              color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                              width: 4,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 24,),

                            // if(dashboardProvider.isLoading)
                            //   const Center(child: CircularProgressIndicator(),)
                            // else
                            if(dashboardProvider.weatherData != null)
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                width: double.infinity,
                                child:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: dashboardProvider.
                                                  weatherData!.
                                                  weather.
                                                  map((weather)
                                                  => Text(
                                                    "${weather.main},\t\t",
                                                    style: Provider.of<GlobalProvider>(context, listen: false).roboto18Bold,
                                                  )).toList(),
                                                ),

                                                Text(
                                                  "humid : ${dashboardProvider.weatherData!.main.humidity}%",
                                                  style: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${dashboardProvider.weatherData!.main.temp}, \t",
                                                  style: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
                                                ),
                                                Text(
                                                  "like : ${dashboardProvider.weatherData!.main.feelsLike}",
                                                  style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "min : ${dashboardProvider.weatherData!.main.tempMin}",
                                                  style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
                                                ),
                                                Text("\t|\t", style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,),
                                                Text(
                                                  "max : ${dashboardProvider.weatherData!.main.tempMax}",
                                                  style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Wind speed : ${dashboardProvider.weatherData!.wind.speed} m/s",
                                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                                            ),
                                          ],
                                        ),

                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Country : ${dashboardProvider.weatherData!.sys.country}",
                                              style: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
                                            ),
                                            Text("Visibility : ${dashboardProvider.weatherData!.visibility}",
                                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14Bold,
                                            ),
                                            Text(
                                              dashboardProvider.weatherData!.name,
                                              style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 28,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Base : ${dashboardProvider.weatherData!.base}",
                                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14Bold,
                                            ),
                                            Text(
                                              "system id : ${dashboardProvider.weatherData!.sys.id}",
                                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14Bold,
                                            ),
                                            Text(
                                              "response : ${dashboardProvider.weatherData!.cod}",
                                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14Bold,
                                            ),
                                          ],
                                        ),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "At : ",
                                              style: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
                                            ),
                                            Text(
                                              "lat ${dashboardProvider.weatherData!.coord.lat}",
                                              style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
                                            ),
                                            Text(
                                              "lon ${dashboardProvider.weatherData!.coord.lon}",
                                              style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )

                            else
                              const Text("no data"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),),
            ),
            backgroundColor: Colors.black,
          ),
        );
      },
    );
  }
}