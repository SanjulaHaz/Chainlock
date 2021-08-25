import 'package:chainlock/screens/warning.dart';
import 'package:chainlock/widgets/custom-text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sec5 extends StatelessWidget {
  final PageController controller;

  const Sec5({Key key, this.controller}) : super(key: key);
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
                  text: "Security seal DOVID",
                  isBold: true,
                  size: ScreenUtil().setSp(35),
                ),
              ),
            ),
            CustomText(
              text:
                  "A DOVID is also attached to the security seal and protects the private key against unintentional reading.\n\nThe locks are closed or open depending on the viewing angle and change their color from orange to green. Depending on the viewing angle, the texts \"chainlock\" and \"private key\" can be read in the background.\n\nDoes the card's security seal match this description?",
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
                      controller.animateToPage(5,
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
