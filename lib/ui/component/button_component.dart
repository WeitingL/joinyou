import 'package:flutter/cupertino.dart';

class OutlineButton extends StatelessWidget {
  Color color;
  String content;

  OutlineButton({super.key, required this.color, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Text(content, style: TextStyle(color: color, fontSize: 12), textAlign: TextAlign.center),
        ));
  }
}
