import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:joinyou/app_color.dart';

import '../my_team/my_team_bloc.dart';
import 'find_team_bloc.dart';

class FindTeamByMap extends StatefulWidget {
  const FindTeamByMap({super.key});

  @override
  State<StatefulWidget> createState() => _FindTeamByMap();
}

class _FindTeamByMap extends State<FindTeamByMap>
    with SingleTickerProviderStateMixin {
  static const CameraPosition _initTaipei = CameraPosition(
    target: LatLng(25.033142, 121.564212),
    zoom: 15,
  );

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  bool _showDetail = true;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = BottomSheet.createAnimationController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MyTeamCubit(),
        child: BlocBuilder<MyTeamCubit, IMyTeamState>(
            builder: (context, state) => Scaffold(
                  body: Stack(children: [
                    GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _initTaipei,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      markers: {
                        Marker(
                            markerId: MarkerId("1"),
                            position: LatLng(25.033142, 121.564212))
                      },
                    ),

                    //Title
                    const SafeArea(child: ToolBarArea()),
                  ]),
                  floatingActionButton: Container(
                      padding: _showDetail
                          ? const EdgeInsets.only(bottom: 100)
                          : const EdgeInsets.only(bottom: 0),
                      child: FloatingActionButton(
                        backgroundColor: AppColor.white,
                        shape: const CircleBorder(),
                        onPressed: () {},
                        child: const Icon(Icons.location_searching),
                      )),
                  bottomSheet: _showDetail
                      ? BottomSheet(
                          animationController: _animationController,
                          onClosing: () {
                            setState(() {
                              _showDetail = false;
                            });
                          },
                          builder: (context) {
                            return Container(height: 300);
                          })
                      : null,
                )));
  }
}

class ToolBarArea extends StatefulWidget {
  const ToolBarArea({super.key});

  @override
  State<StatefulWidget> createState() => _ToolBarArea();
}

class _ToolBarArea extends State<ToolBarArea> {
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
                  Navigator.of(context).pop();
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
                  Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColor.title_green, width: 2),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_month_sharp,
                              color: AppColor.title_green),
                          SizedBox(width: 4),
                          Text(
                            "5/1",
                            style: TextStyle(color: AppColor.title_green),
                          )
                        ],
                      ))
                ])))
      ],
    );
  }
}
