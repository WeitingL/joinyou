import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingTeamLocation extends StatefulWidget {
  const SettingTeamLocation({super.key});

  @override
  State<StatefulWidget> createState() => _SettingTeamLocation();
}

class _SettingTeamLocation extends State<SettingTeamLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("新增球隊位置"),
      ),
      body: Column(),
    );
  }

}