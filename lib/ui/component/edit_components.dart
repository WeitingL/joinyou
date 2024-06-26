import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joinyou/app_color.dart';

class DropDownSelected extends StatefulWidget {
  String title;
  String dropTitle;
  List<DropdownMenuItem<int>> items = [];
  Function(int?) onChanged;

  DropDownSelected(
      {super.key,
      required this.title,
      required this.dropTitle,
      required this.items,
      required this.onChanged});

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
              style:
                  const TextStyle(color: AppColor.text_grey_94, fontSize: 18)),
          icon: const Icon(Icons.expand_more),
          style: const TextStyle(
              backgroundColor: AppColor.transparent, color: AppColor.black),
          items: widget.items,
          onChanged: (int? value) {
            widget.onChanged(value);
          },
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
  Function(String) onChanged;

  EditNumContentArea(
      {super.key,
      required this.title,
      required this.hintTitle,
      required this.onChanged});

  @override
  State<StatefulWidget> createState() => _EditNumContentArea();
}

class _EditNumContentArea extends State<EditNumContentArea> {
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
          onChanged: widget.onChanged,
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

class EditTextContentArea extends StatefulWidget {
  String title;
  String hintTitle;

  EditTextContentArea(
      {super.key, required this.title, required this.hintTitle});

  @override
  State<StatefulWidget> createState() => _EditTextContentArea();
}

class _EditTextContentArea extends State<EditTextContentArea> {
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
          keyboardType: TextInputType.text,
          inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
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
