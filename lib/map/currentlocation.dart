import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late GoogleMapController mapController;
  Location location = Location();
  LatLng? currentLocation; // Make currentLocation nullable

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    try {
      LocationData currentLocationData = await location.getLocation();
      setState(() {
        currentLocation = LatLng(
          currentLocationData.latitude ?? 0.0,
          currentLocationData.longitude ?? 0.0,
        );
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location on Google Maps'),
      ),
      body: currentLocation == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLocation!,
                zoom: 14.0,
              ),
              markers: <Marker>[
                Marker(
                  markerId:  MarkerId("1"),
                  position: currentLocation!,
                  infoWindow: InfoWindow(
                    title: 'Current Location',
                    snippet: 'This is your current location.',
                  ),
                ),
              ].toSet(),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
    );
  }
}
