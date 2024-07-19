import 'dart:async';
import 'package:location/location.dart';
import '../models/location_model.dart';

class LocationService{
  Location location = Location();
  StreamController<LocationModel> _locationStreamController = StreamController();
  Stream<LocationModel> get locationStream => _locationStreamController.stream;

  LocationService(){
    location.requestPermission().then((permissionStatus){
      if(permissionStatus == PermissionStatus.granted){
        location.onLocationChanged.listen((locationData){
          if(locationData != null){
            _locationStreamController.add(
                LocationModel(
                  latitude: locationData.latitude!,
                  longitude: locationData.longitude!,
                )
            );
          }
        });
      }
    });
  }

  void dispose(){
    _locationStreamController.close();
  }
}