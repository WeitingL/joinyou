import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joinyou/app_color.dart';

class DropDownSelected extends StatefulWidget {
  String title;
  String dropTitle;
  List<DropdownMenuItem> items = [];

  DropDownSelected({super.key, required this.title, required this.dropTitle});

  @override
  State<StatefulWidget> createState() => _DropDownSelected();
}

class _DropDownSelected extends State<DropDownSelected> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 4),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 18),
            )),
        DropdownButtonFormField(
          hint: Text(widget.dropTitle,
              style: const TextStyle(color: AppColor.text_grey_94, fontSize: 18)),
          icon: const Icon(Icons.expand_more),
          style: const TextStyle(
              backgroundColor: AppColor.transparent, color: AppColor.black),
          items: const [
            DropdownMenuItem(child: Text("1"), value: 1),
            DropdownMenuItem(child: Text("2"), value: 2)
          ],
          onChanged: (int? value) {},
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: AppColor.title_green, width: 2)),
          ),
        )
      ],
    );
  }
}

class EditNumContentArea extends StatefulWidget {
  String title;
  String hintTitle;

  EditNumContentArea({super.key, required this.title, required this.hintTitle});

  @override
  State<StatefulWidget> createState() => _EditContentArea();
}

class _EditContentArea extends State<EditNumContentArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 4),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 18),
            )),
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
              hintText: widget.hintTitle,
              hintStyle: TextStyle(color: AppColor.text_grey_94),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        )
      ],
    );
  }
}
