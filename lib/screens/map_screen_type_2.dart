
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/dashboard_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/firestore_service.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/map_screen/show_my_area.dart';

import '../providers/global_provider.dart';

class MapScreenType2 extends StatefulWidget {
  const MapScreenType2({super.key});

  @override
  State<MapScreenType2> createState() => _MapScreenType2State();
}

class _MapScreenType2State extends State<MapScreenType2> {
  Completer<GoogleMapController> gMapController = Completer();

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
            actions: [
              Text(
                "$latitude, $longitude",
                style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  child: const Icon(Icons.add_circle_rounded, size: 38,),
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) {return dashboardProvider.addLocation(context);},
                    );
                  },
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(latitude!, longitude!),
                  zoom: 20,
                ),
                mapType: MapType.hybrid,
                rotateGesturesEnabled: true,
                scrollGesturesEnabled: true,
                tiltGesturesEnabled: true,
                onMapCreated: (GoogleMapController gMapController){
                  this.gMapController.complete(gMapController);
                },
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 14,),
                      StreamBuilder(
                        stream: collectionReference.snapshots(),
                        builder: (context, snapshot) {
                          if(snapshot.hasData){
                            return Row(
                              children: snapshot.data!.docs.map((e){
                                var data = e.data() as Map<String, dynamic>;
                                return ShowMyArea(
                                  name: data["name"].toString(),
                                  desc: data["desc"].toString(),
                                  latitude: data["latitude"].toString(),
                                  longitude: data["longitude"].toString(),
                                  nameTextStyle: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
                                  descTextStyle: Provider.of<GlobalProvider>(context, listen: false).roboto16,
                                  latLongTextStyle: Provider.of<GlobalProvider>(context, listen: false).roboto14Bold,
                                  onClickPlace: () async {
                                    try {
                                      GoogleMapController controller = await gMapController.future;
                                      CameraPosition cameraPosition = CameraPosition(
                                        target: LatLng(
                                          data["latitude"],
                                          data["longitude"],
                                        ),
                                        zoom: 20,
                                      );
                                      CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(cameraPosition);
                                      controller.animateCamera(cameraUpdate);
                                    } catch (e) {
                                      print("Error moving camera: $e");
                                    }
                                  },
                                  deleteArea: () async {
                                    await collectionReference.doc(e.id).delete();
                                  },
                                );
                                // return ShowMyArea(
                                //   name: (e.data() as dynamic)["name"].toString(),
                                //   desc: (e.data() as dynamic)["desc"].toString(),
                                //   latitude: (e.data() as dynamic)["latitude"].toString(),
                                //   longitude: (e.data() as dynamic)["longitude"].toString(),
                                //   nameTextStyle: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
                                //   descTextStyle: Provider.of<GlobalProvider>(context, listen: false).roboto16,
                                //   latLongTextStyle: Provider.of<GlobalProvider>(context, listen: false).roboto14Bold,
                                //   onClickPlace: ()async{
                                //     try{
                                //       GoogleMapController gMapController = await this.gMapController.future;
                                //       CameraPosition cameraPosition = CameraPosition(
                                //         target: LatLng(
                                //           double.parse((e.data() as dynamic)["latitude"]),
                                //           double.parse((e.data() as dynamic)["longitude"]),
                                //         ),
                                //         zoom: 18,
                                //       );
                                //       CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(cameraPosition);
                                //       gMapController.animateCamera(cameraUpdate);
                                //     }catch(e){
                                //       print("salah tolol : $e");
                                //     }
                                //
                                //     // setState(() {});
                                //   },
                                //   deleteArea: () async{await collectionReference.doc(e.id).delete();},
                                // );
                              }).toList(),
                            );
                          }else{
                            return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}