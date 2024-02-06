import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:joinyou/app_color.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import '../../NavigationHelper.dart';
import '../../data/data_team.dart';
import '../../data/team_data_type.dart';
import '../component/bottom_bar.dart';
import '../my_team/my_team_bloc.dart';

class FindTeamByMap extends StatefulWidget {
  const FindTeamByMap({super.key});

  @override
  State<StatefulWidget> createState() => _FindTeamByMap();
}

class _FindTeamByMap extends State<FindTeamByMap>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late GoogleMapController _mapController;
  late Position _currentPosition;

  List<TeamData> teamList = [TeamData()];
  bool _showDetail = false;

  @override
  void initState() {
    _animationController = BottomSheet.createAnimationController(this);
    _getCurrentLocation();
    super.initState();
  }

  static const CameraPosition _initTaipei = CameraPosition(
    target: LatLng(25.033142, 121.564212),
    zoom: 15,
  );

  _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
      });

      // Move the camera to the user's current location
      _mapController.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude),
        ),
      );
    } catch (e) {
      print('Error getting location: $e');
      // Handle the error, show a message to the user, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MyTeamCubit(),
        child: BlocBuilder<MyTeamCubit, IMyTeamState>(
            builder: (context, state) => Stack(
                  children: [_buildMap(), SafeArea(child: ToolBarArea())],
                )));
  }

  Scaffold _buildMap() {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initTaipei,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        markers: {
          Marker(
            markerId: MarkerId("1"),
            position: LatLng(25.033142, 121.564212),
            onTap: () {
              _showBottomPage("台北市南港區三重路19-2號", "每人每小時 100 元"); // 在点击标记时显示底部页面
              setState(() {
                _showDetail = !_showDetail;
              });
            },
          )
        },
      ),
      floatingActionButton: Container(
          padding: _showDetail
              ? const EdgeInsets.only(bottom: 200)
              : const EdgeInsets.only(bottom: 0),
          child: FloatingActionButton(
            backgroundColor: AppColor.white,
            shape: const CircleBorder(),
            onPressed: _getCurrentLocation,
            child: const Icon(Icons.my_location),
          )),
    );
  }

  void _showBottomPage(String location, String fees) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.40,
          widthFactor: 1.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                // bar
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                SizedBox(height: 30),
                // info area
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("球團資訊",
                            style: TextStyle(
                                fontSize: 18, color: AppColor.title_green)),
                        SizedBox(height: 8),
                        Text(location, style: TextStyle(fontSize: 18)),
                        SizedBox(height: 20),
                        Text("收費方式",
                            style: TextStyle(
                                fontSize: 18, color: AppColor.title_green)),
                        SizedBox(height: 8),
                        Text(fees, style: TextStyle(fontSize: 18)),
                      ],
                    )),

                SizedBox(height: 20),
                BottomBarCenterButton(
                    action: () {
                      GoRouter.of(context).pushReplacement(
                          NavigationHelper.TEAM_OPT_PAGE,
                          extra: {
                            "teamData": teamList[0], //TODO
                            "infoType": InfoType.MemberPage
                          });
                      context.pop();
                    },
                    content: "球隊報名")
              ],
            ),
          ),
        );
      },
    ).then((value) {
      setState(() {
        _showDetail = false;
      });
    });
  }
}

class BottomSheetArea extends StatelessWidget {
  const BottomSheetArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Text('BottomSheet'),
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
                onTap: () {
                  context.pop();
                },
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
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColor.title_green, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_month_sharp,
                              color: AppColor.title_green),
                          SizedBox(width: 4),
                          Text(
                            formatDate(
                                (selectedDate ?? DateTime.now()).toString()),
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

  String formatDate(String dateString) {
    // 将字符串解析为日期时间对象
    DateTime dateTime = DateTime.parse(dateString);

    // 使用 DateFormat 格式化日期，将其转换为指定格式
    DateFormat formatter = DateFormat('MM-dd');
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }
}
