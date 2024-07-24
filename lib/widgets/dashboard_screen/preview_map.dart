import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/dashboard_provider.dart';

class PreviewMap extends StatelessWidget {
  MapType mapType;
  double zoom;
  Function() seeFullMap;

  PreviewMap({
    super.key,
    required this.mapType,
    required this.zoom,
    required this.seeFullMap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, child) {
        double? latitude = dashboardProvider.targetLat;
        double? longitude = dashboardProvider.targetLon;
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).orientation==Orientation.portrait?
          MediaQuery.of(context).size.height/4 :
          MediaQuery.of(context).size.width/4,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Stack(
            children: [
              if(latitude != null && longitude != null)
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(latitude, longitude,),
                      zoom: zoom,
                    ),
                    mapType: mapType,
                    rotateGesturesEnabled: true,
                    scrollGesturesEnabled: true,
                    tiltGesturesEnabled: true,
                  ),
                )
              else
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),

              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.arrow_forward, color: Colors.black,
                      size: 18,
                    ),
                  ),
                  onTap: () => seeFullMap(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}