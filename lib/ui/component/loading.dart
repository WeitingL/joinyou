import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';

class Loading extends StatelessWidget {
  double size;

  Loading({super.key, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size, height: size,
        child: CircularProgressIndicator(
            color: AppColor.title_green,
            strokeWidth: size/10,
        ));
  }
}
