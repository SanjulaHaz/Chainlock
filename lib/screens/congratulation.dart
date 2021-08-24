import 'package:chainlock/widgets/custom-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Congratulations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffad42),
      appBar: AppBar(
        title: Text("Check a card"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Color(0xffF5F5F5),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setWidth(80),
              horizontal: ScreenUtil().setWidth(45),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(200),
                  child: Image.network(
                      "https://image.flaticon.com/icons/png/512/5110/5110939.png"),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(80),
                ),
                CustomText(
                  text: "Congratulations!",
                  size: ScreenUtil().setSp(45),
                  isBold: true,
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(50),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(540),
                  child: CustomText(
                    text: "The check of your chainlock card has been completed",
                    align: TextAlign.center,
                    color: Color(0xff4d5153),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(50),
                ),
                CustomText(
                  text: "Chainlock card number",
                  size: ScreenUtil().setSp(32),
                  isBold: true,
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                CustomText(
                  text: "2000154547895446698745",
                  color: Color(0xff4d5153),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(50),
                ),
                CustomText(
                  size: ScreenUtil().setSp(32),
                  text: "Public Address",
                  isBold: true,
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                CustomText(
                  text: "45sBfjgV5454trG545788Hbsd45",
                ),
              ],
            ),
          ),
          elevation: 5,
        ),
      ),
    );
  }
}
