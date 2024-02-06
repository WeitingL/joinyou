import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../app_color.dart';

class FullMapLocationSetting extends StatefulWidget {
  const FullMapLocationSetting({Key? key}) : super(key: key);

  @override
  State<FullMapLocationSetting> createState() => _FullMapLocationSettingState();
}

class _FullMapLocationSettingState extends State<FullMapLocationSetting> {
  late GoogleMapController mapController;
  late LatLng centerMarkerPosition =
      LatLng(25.0669992, 121.6168995); // 初始座標，你可以根據需求更改

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('新增球隊位置'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0), // 設置 Divider 的高度
            child: Container(
              color: Colors.grey, // Divider 的顏色
              height: 1.0,
            ),
          ),
        ),
        body: Stack(children: [
          Positioned(
              child: GoogleMap(
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
              zoom: 16.0,
            ),
            markers: {
              // 這裡是你的中心點, 但我不一定是要用這個顯示在畫面上！
              Marker(
                markerId: MarkerId(centerMarkerPosition.toString()),
                position: centerMarkerPosition,
                icon: BitmapDescriptor.defaultMarker,
              ),
            },
          )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 80,
              child: Center(
                  child: GestureDetector(
                      onTap: () {
                        context.pop(centerMarkerPosition);
                      },
                      child: Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              color: AppColor.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text("確定位置",
                                  style: TextStyle(color: AppColor.white)))))))
        ]));
  }
}
