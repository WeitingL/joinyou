import 'dart:ui';

import 'package:flutter/material.dart';

class RankPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RankPage();
}

class _RankPage extends State<RankPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Column(
          children: [Text("RankPage")],
        )),
        Positioned(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    // 調整模糊程度，sigmaX和sigmaY分別是水平和垂直方向的標準差
                    child: Container(
                      color: Colors.grey.withOpacity(0.2),
                    ))))
      ],
    );
  }
}
