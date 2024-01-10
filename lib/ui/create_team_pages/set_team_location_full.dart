import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FullMapLocationSetting extends StatefulWidget {
  const FullMapLocationSetting({Key? key}) : super(key: key);

  @override
  State<FullMapLocationSetting> createState() => _FullMapLocationSettingState();
}

class _FullMapLocationSettingState extends State<FullMapLocationSetting> {
  late GoogleMapController mapController;
  late LatLng centerMarkerPosition = LatLng(25.0669992,121.6168995); // 初始座標，你可以根據需求更改

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map with Center Marker'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        onCameraMove: (CameraPosition position) {
          setState(() {
            centerMarkerPosition = position.target;
          });
        },
        initialCameraPosition: CameraPosition(
          target: centerMarkerPosition,
          zoom: 2.0,
        ),
        markers: {
          // 這裡是你的中心點, 但我不一定是要用這個顯示在畫面上！
          Marker(
            markerId: MarkerId(centerMarkerPosition.toString()),
            position: centerMarkerPosition,
            icon: BitmapDescriptor.defaultMarker,
          ),
        },
      ),
    );
  }
}