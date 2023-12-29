import 'package:flutter/cupertino.dart';
import 'package:joinyou/app_color.dart';

class TeamCard extends StatefulWidget {
  const TeamCard({super.key});

  @override
  State<StatefulWidget> createState() => _TeamCard();
}

class _TeamCard extends State<TeamCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Container(
          width: 340,
          height: 166,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.grey, width: 2.0),
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColor.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0)),
                      )),

                  // Content
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("球團名稱"),
                      Text("110台北市信義區市府路1號5樓"),
                      Text("\$200 TWD / 次")
                    ],
                  )
                ],
              ),
              //-----------------------------//

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Flexible(child: Column(
                    children: [Text("時段"), Text("平日 17 - 19")],
                  )),
                  Flexible(child: Container(
                    width: 1,
                    height: 23,
                    color: AppColor.black,
                  )),
                  const Flexible(child: Column(
                    children: [Text("程度"), Text("初階 - 中階")],
                  )),
                  Flexible(child: Container(
                    width: 1,
                    height: 23,
                    color: AppColor.black,
                  )),
                  const Flexible(child: Column(
                    children: [Text("距離"), Text("0.5 KM")],
                  ))
                ],
              )
            ],
          ),
        ));
  }
}
