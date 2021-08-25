import 'package:chainlock/screens/warning.dart';
import 'package:chainlock/widgets/custom-text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sec6 extends StatelessWidget {
  final PageController controller;

  const Sec6({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(45)),
                child: CustomText(
                  text: "Security punchings",
                  isBold: true,
                  size: ScreenUtil().setSp(35),
                ),
              ),
            ),
            CustomText(
              text:
                  "There are security punchings on the edge of the security seal. These should be recognizable as small v-shaped cuts. If someone tried to remove the seal, those cuts indicate this - it is not possible to put the seal back on the card as shown in the pictures.\n\nAre the security punchings intact?",
              color: Color(0xff697378),
              size: ScreenUtil().setSp(25),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffbdbdbd),
                        padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(20),
                        ),
                        elevation: 5,
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(40),
                        ),
                      ),
                      child: CustomText(
                        text: "NO",
                        size: ScreenUtil().setSp(30),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Warning()),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(20),
                      ),
                      elevation: 5,
                      textStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(40),
                      ),
                    ),
                    child: CustomText(
                      text: "YES",
                      size: ScreenUtil().setSp(30),
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.animateToPage(6,
                          curve: Curves.ease,
                          duration: Duration(milliseconds: 200));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
