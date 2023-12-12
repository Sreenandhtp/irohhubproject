import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Integration'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Replace with your desired initial location
          zoom: 14.0, // Zoom level
        ),
        markers: <Marker>[
          Marker(
            markerId: MarkerId("1"),
            position: LatLng(37.7749, -122.4194), // Replace with your marker's position
            infoWindow: InfoWindow(
              title: 'Marker Title',
              snippet: 'Marker Snippet',
            ),
          ),
        ].toSet(),
      ),
    );
  }
}