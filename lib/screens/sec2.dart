import 'package:chainlock/screens/home.dart';
import 'package:chainlock/screens/sec1.dart';
import 'package:chainlock/widgets/custom-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sec2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check a card"),
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(45)),
                child: CustomText(
                  text: "Address",
                  isBold: true,
                  size: ScreenUtil().setSp(35),
                ),
              ),
            ),
            CustomText(
              text:
                  "Is this address visible on the card identical to the onw below?",
              color: Color(0xff697378),
              size: ScreenUtil().setSp(25),
            ),
            CustomText(
              text: "1BgsasdhGkk23238asdkjj",
              size: ScreenUtil().setSp(25),
              isBold: true,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(100),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffbdbdbd),
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(20),
                    horizontal: ScreenUtil().setHeight(250),
                  ),
                  elevation: 5,
                  textStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(40),
                  ),
                ),
                child: CustomText(
                  text: "OK",
                  size: ScreenUtil().setSp(30),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sec1(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
