import 'dart:ui';

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Column(
              children: [Text("ChatPage")],
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
