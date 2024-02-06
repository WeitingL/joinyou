import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: 110,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[300],
            child: const Row(
              children: [
                ImageIcon(AssetImage("assets/ic_profile.png"),
                    size: 80, color: Colors.grey),
                Text("使用者名稱",
                    style: TextStyle(fontSize: 24, color: Colors.grey))
              ],
            )),
        Padding(
            padding: EdgeInsets.only(left: 24),
            child: Column(
              children: [
                SizedBox(height: 24),
                SettingItem(title: "個人資料", onPress: null),
                Divider(),
                SettingItem(title: "變更密碼", onPress: null),
                Divider(),
                SizedBox(height: 30),
                SettingItem(title: "使用條款", onPress: null),
                Divider(),
                SettingItem(title: "聯絡客服", onPress: null),
                Divider(),
                SettingItem(title: "刪除帳號", onPress: null),
                Divider(),
                SettingItem(title: "登出", onPress: null),
              ],
            ))
      ],
    );
  }
}

class SettingItem extends StatelessWidget {
  String title;
  VoidCallback? onPress;

  SettingItem({required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          color: Colors.transparent,
          child: Column(children: [
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 12),
                Text(title, style: TextStyle(fontSize: 20)),
                Expanded(child: Container()),
                if (onPress != null) const Icon(Icons.arrow_forward_ios),
              ],
            ),
            SizedBox(height: 10),
          ]),
        ));
  }
}
