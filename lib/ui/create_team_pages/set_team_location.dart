import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:joinyou/app_color.dart';
import 'package:joinyou/ui/create_team_pages/set_team_location_full.dart';

import '../../NavigationHelper.dart';
import '../component/bottom_bar.dart';
import '../component/edit_components.dart';

class SettingTeamLocation extends StatefulWidget {
  SettingTeamLocation({super.key});

  @override
  State<StatefulWidget> createState() => _SettingTeamLocation();
}

class _SettingTeamLocation extends State<SettingTeamLocation> {
  LatLng? _position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("新增球隊位置"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0), // 設置 Divider 的高度
            child: Container(
              color: Colors.grey, // Divider 的顏色
              height: 1.0,
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              height: 220,
              color: AppColor.text_grey_94,
              child: Stack(
                children: [
                  Positioned(child: MapWidget(position: _position)),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 20,
                      child: Center(
                          child: GestureDetector(
                              onTap: () async {
                                LatLng? position = await context.push(
                                    NavigationHelper
                                        .CREATE_TEAM_LOCATION_MAP_PAGE);

                                if (position != null) {
                                  setState(() {
                                    _position = position;
                                  });
                                }
                              },
                              child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: AppColor.black,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text("球隊位置",
                                          style: TextStyle(
                                              color: AppColor.white)))))))
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EditTextContentArea(title: "地址", hintTitle: "請選擇場地址"),
                    SizedBox(height: 20),
                    EditTextContentArea(title: "附近資訊(選填)", hintTitle: "請輸入附近資訊")
                  ],
                )),
            const Spacer(),
            const Divider(),
            BottomBarNext(
                content: "下一步",
                action: () {
                  GoRouter.of(context)
                      .push(NavigationHelper.CREATE_TEAM_PAGE_A);
                })
          ],
        )));
  }
}

class MapWidget extends StatefulWidget {
  final LatLng? position;

  MapWidget({Key? key, this.position}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double mapHeight = screenHeight / 3;

    return Container(
      height: mapHeight,
      child: GoogleMap(
        rotateGesturesEnabled: false,
        scrollGesturesEnabled: false,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        tiltGesturesEnabled: false,
        myLocationButtonEnabled: false,
        initialCameraPosition: getInitialCameraPosition(widget.position),
        markers: {
          Marker(
            markerId: MarkerId('current'),
            position: widget.position ?? LatLng(25.033142, 121.564212),
          ),
        },
        onMapCreated: (controller) {
          _mapController = controller;
        },
      ),
    );
  }

  @override
  void didUpdateWidget(covariant MapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.position != oldWidget.position) {
      _updateCameraPosition(widget.position);
    }
  }

  CameraPosition getInitialCameraPosition(LatLng? position) {
    return CameraPosition(
      target: position ?? LatLng(25.033142, 121.564212),
      zoom: 15,
    );
  }

  void _updateCameraPosition(LatLng? position) {
    if (position != null) {
      _mapController.animateCamera(
        CameraUpdate.newLatLng(position),
      );
    }
  }
}