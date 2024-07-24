import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/dashboard_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/firestore_service.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, child) {
        double? latitude = dashboardProvider.targetLat;
        double? longitude = dashboardProvider.targetLon;
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(latitude!, longitude!),
                  zoom: 18,
                ),
                mapType: MapType.hybrid,
              ),

              Align(
                alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 14,),
                        StreamBuilder(
                          stream: collectionReference.where("uid", isEqualTo: dashboardProvider.uid).snapshots(),
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              return Row(
                                children: snapshot.data!.docs.map((e) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 14, bottom: 20),
                                    padding: const EdgeInsets.all(18),
                                    width: MediaQuery.of(context).size.width - 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(color: Colors.white, width: 2,),
                                      color: Colors.black,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: GestureDetector(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "Name : ${(e.data() as dynamic)["name"]}",
                                                ),
                                                Text("Desc : ${(e.data() as dynamic)["desc"]}", overflow: TextOverflow.ellipsis,),
                                                Row(
                                                  children: [
                                                    Text("lat, long : ${(e.data() as dynamic)["latitude"]},",),
                                                    Text("${(e.data() as dynamic)["latitude"]}, ${(e.data() as dynamic)["longitude"]}",),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            onTap: (){},
                                          ),
                                        ),
                                        GestureDetector(
                                          child: const Icon(
                                            Icons.delete,
                                          ),
                                          onTap: (){},
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              );
                            } else {
                              return Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 14, bottom: 20),
                                    padding: const EdgeInsets.all(18),
                                    width: MediaQuery.of(context).size.width - 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: Colors.black,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Name : waiting...",
                                            ),
                                            Text("Desc : waiting...",),
                                            Text("latlong : waiting...",),
                                          ],
                                        ),
                                        Icon(
                                          Icons.delete,
                                        ),
                                      ],
                                    ),
                                  )
                                ]
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        );
      },
    );
  }
}