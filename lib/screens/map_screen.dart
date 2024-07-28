import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/dashboard_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/global_provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/services/firestore_service.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/widgets/map_screen/input_data_dialog.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  // TextEditingController nameController = TextEditingController();
  // TextEditingController descController = TextEditingController();
  // TextEditingController latController = TextEditingController();
  // TextEditingController lonController = TextEditingController();

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   descController.dispose();
  //   latController.dispose();
  //   lonController.dispose();
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

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
          body: StreamBuilder(
            stream: collectionReference.where("uid", isEqualTo: dashboardProvider.uid).snapshots(),
            builder: (_, snapshot) {
              if(snapshot.hasData){
                List<Marker> markers = snapshot.data!.docs.map<Marker>((doc) {
                  var data = doc.data() as Map<String, dynamic>;
                  return Marker(
                    markerId: MarkerId(data['name']),
                    position: LatLng(data['latitude'], data['longitude']),
                    infoWindow: InfoWindow(title: data['name'], snippet: data['desc']),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                  );
                }).toList();
                return Stack(
                  children: [
                    GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(latitude!, longitude!),
                          zoom: 18,
                        ),
                        mapType: MapType.hybrid,
                        markers: Set<Marker>.of(markers)
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(width: 14,),
                            ...snapshot.data!.docs.map<Widget>((e) {
                              var data = e.data() as Map<String, dynamic>;
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
                                            Text("Name: ${data['name']}",),
                                            Text(
                                              "Desc: ${data['desc']}",
                                              overflow: TextOverflow.ellipsis,),
                                            Row(
                                              children: [
                                                Text("lat: ${data['latitude']}, ",),
                                                Text("lon: ${data['longitude']}",),
                                              ],
                                            ),
                                          ],
                                        ),
                                        onTap: (){},
                                      ),
                                    ),
                                    GestureDetector(
                                      child: const Icon(Icons.delete,),
                                      onTap: ()async{
                                        await collectionReference.doc(e.id).delete();
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              );
                            })
                            // .toList(),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else{
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue,),
                );
              }
            },
          ),
        );
      },
    );
  }
}