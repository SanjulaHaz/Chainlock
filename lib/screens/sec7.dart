import 'package:chainlock/widgets/custom-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sec7 extends StatelessWidget {
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
                  text: "Security seal surface",
                  isBold: true,
                  size: ScreenUtil().setSp(35),
                ),
              ),
            ),
            CustomText(
              text:
                  "The scratch field of the security seal should only be scratched off if the card is to be emptied. Until then, a completely closed, shimmering metallic surface protects the private key against reading. The private key cannot be seen.\n\nIf the text \"seal broken\" appears in the orange area of the seal, an attempt was made to break the seal - do not use such a card anymore!\n\nThe private key is covered with the security seal?",
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
                      onPressed: () {},
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
                    onPressed: () {},
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
