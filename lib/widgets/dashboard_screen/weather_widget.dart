import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/dashboard_provider.dart';

import '../../providers/global_provider.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, child) {
        return Column(
          children: [
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
                                  "${(dashboardProvider.weatherData!.main.temp - 273.15).toStringAsFixed(2)}°, \t",
                                  style: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
                                ),
                                Text(
                                  "like : ${(dashboardProvider.weatherData!.main.feelsLike - 273.15).toStringAsFixed(2)}°",
                                  style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "min : ${dashboardProvider.weatherData!.main.tempMin}°",
                                  style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
                                ),
                                Text("\t|\t", style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,),
                                Text(
                                  "max : ${dashboardProvider.weatherData!.main.tempMax}°",
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
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                            ),
                            Text(
                              "lon ${dashboardProvider.weatherData!.coord.lon}",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            else
            // const Text("no data"),
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
                            Text(
                              "Waiting...,\t\t",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                            ),
                            Text(
                              "Waiting...",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                            ),
                            Text(
                              "Waiting...°",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                            ),
                            Text(
                              "Waiting...",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                            ),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Waiting...",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Waiting...",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Waiting...",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                              overflow: TextOverflow.ellipsis,
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
                              "Waiting...",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                            ),
                            Text(
                              "Waiting...",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                            ),
                            Text(
                              "response : 404",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Waiting...",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                            ),
                            Text(
                              "Waiting...",
                              style: Provider.of<GlobalProvider>(context, listen: false).roboto14SemiBold,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
          ],
        );
      },
    );
  }
}