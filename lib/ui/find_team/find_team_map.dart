import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:joinyou/app_color.dart';
import 'package:geolocator/geolocator.dart';

import '../my_team/my_team_bloc.dart';



class FindTeamByMap extends StatefulWidget {
  const FindTeamByMap({super.key});

  @override
  State<StatefulWidget> createState() => _FindTeamByMap();
}

class _FindTeamByMap extends State<FindTeamByMap>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late GoogleMapController mapController;
  late Position currentLocation;

  bool _showDetail = true;


  @override
  void initState() {
    _animationController = BottomSheet.createAnimationController(this);
    super.initState();
    _getLocation();
  }

  static const CameraPosition _initTaipei = CameraPosition(
    target: LatLng(25.033142, 121.564212),
    zoom: 15,
  );


  _goToCurrentLocation() {
      mapController.animateCamera(
        CameraUpdate.newLatLng(LatLng(currentLocation.latitude, currentLocation.longitude)),
      );
  }

  _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentLocation = position;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MyTeamCubit(),
        child: BlocBuilder<MyTeamCubit, IMyTeamState>(
            builder: (context, state) =>
                Scaffold(
                  body: currentLocation == null
                      ? Center(child: CircularProgressIndicator(),)
                   : GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _initTaipei,
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                      },
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      markers: {
                        Marker(
                            markerId: MarkerId("1"),
                            position: LatLng(25.033142, 121.564212),
                          onTap: () {
                            _showBottomPage(); // 在点击标记时显示底部页面
                          },
                        )
                      },
                    ),
                  floatingActionButton: Container(
                      padding: _showDetail
                          ? const EdgeInsets.only(bottom: 100)
                          : const EdgeInsets.only(bottom: 0),
                      child: FloatingActionButton(
                        backgroundColor: AppColor.white,
                        shape: const CircleBorder(),
                        onPressed: _goToCurrentLocation,
                        child: const Icon(Icons.my_location),
                      )
                  ),
                )
        )
    );
  }



  void _showBottomPage() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.35,
          widthFactor: 1.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all( Radius.circular(10.0)),
                    ),
                    width: 100.0,
                    height: 10.0,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      "球團地址:",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      "地址:",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      "收費方式",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0), // 加入一些垂直間距
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      "費用:",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Spacer(),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(300.0, 40.0),),
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all( Radius.circular(10.0)), // 設定為長方形，即無圓角
                        ),
                      ), // 設定固定大小
                    ),
                    onPressed: () {
                      print("object");
                      Navigator.pop(context);
                      // 按鈕被點擊時的處理邏輯
                    },
                    child: Text("球隊報名",style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Colors.white,
                    ),),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ToolBarArea extends StatefulWidget {
  const ToolBarArea({super.key});

  @override
  State<StatefulWidget> createState() => _ToolBarArea();
}

class _ToolBarArea extends State<ToolBarArea> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });

      _selectTime(context);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
      print('Selected Date: $selectedDate');
      print('Selected Time: $selectedTime');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
            elevation: 8,
            color: AppColor.transparent,
            surfaceTintColor: AppColor.transparent,
            child: GestureDetector(
                onTap: () {context.pop();},
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back_ios_new),
                ))),
        Card(
            elevation: 8,
            color: AppColor.transparent,
            surfaceTintColor: AppColor.transparent,
            child: Container(
                padding: const EdgeInsets.only(left: 16, right: 10),
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(children: [
                  const Flexible(
                      child: TextField(
                          decoration: InputDecoration(
                              hintText: "想去哪裡？",
                              hintStyle:
                                  TextStyle(color: AppColor.text_grey_94),
                              icon: Icon(Icons.search),
                              iconColor: AppColor.text_grey_94,
                              border: InputBorder.none))),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.title_green, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_month_sharp, color: AppColor.title_green),
                          SizedBox(width: 4),

                          Text(
                            "5/1",
                            style: TextStyle(color: AppColor.title_green),
                          ),
                        ],
                      ),
                    ),
                  )
                ])))
      ],
    );
  }
}
