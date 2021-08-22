import 'dart:ui';

import 'package:chainlock/screens/intro1.dart';
import 'package:chainlock/widgets/custom-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class License extends StatefulWidget {
  @override
  _LicenseState createState() => _LicenseState();
}

class _LicenseState extends State<License> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ChainLock",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(ScreenUtil().setHeight(50)),
              child: SingleChildScrollView(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(color: Color(0xff697378), height: 1.4),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenUtil().setHeight(15),
                ScreenUtil().setHeight(15),
                ScreenUtil().setHeight(15),
                ScreenUtil().setHeight(0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "I have read and accept the license conditions",
                  size: ScreenUtil().setSp(25),
                ),
                Switch(
                  value: isChecked,
                  onChanged: (x) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  activeColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(30),
            ),
            child: GestureDetector(
              child: CustomText(
                text: "CONTINUE",
                size: ScreenUtil().setSp(35),
                color: isChecked ? Colors.black : Color(0xffb1b6ba),
                isBold: true,
              ),
              onTap: () {
                if (isChecked) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Info()),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
