import 'package:chainlock/widgets/custom-text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';

class Warning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) =>
            Home()), (Route<dynamic> route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xffffad42),
        appBar: AppBar(
          title: Text("Check a card"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
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
                            "https://image.flaticon.com/icons/png/512/1672/1672451.png"),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(80),
                      ),
                      CustomText(
                        text: "Warning!",
                        size: ScreenUtil().setSp(45),
                        isBold: true,
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(50),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(540),
                        child: CustomText(
                          text:
                              "Please do not use this card and contact the point of sale where you purchased the card",
                          align: TextAlign.center,
                          color: Color(0xff4d5153),
                          ls: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(100),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(20),
                    horizontal: ScreenUtil().setHeight(150),
                  ),
                  elevation: 5,
                  textStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(40),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) =>
                      Home()), (Route<dynamic> route) => false);
                },
                child: Text("Back to Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
