import 'dart:convert';

import 'package:chainlock/screens/home.dart';
import 'package:chainlock/widgets/custom-text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Sec7 extends StatelessWidget {
  final Map cardDetails;

  const Sec7({Key key, this.cardDetails}) : super(key: key);
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
                    onPressed: () async {
                      try{
                        final storage = FlutterSecureStorage();
                        String cards = await storage.read(key: 'cards');
                        if(cards!=null){
                          List fetchedCards = cards.split(';');
                          fetchedCards.add(jsonEncode(cardDetails));
                          String listStr = "";
                          fetchedCards.forEach((element) {
                            listStr += element+";";
                          });
                          print(listStr);
                          await storage.write(key: 'cards', value: listStr.substring(0, listStr.length - 1));
                        }
                        else{
                          String listStr = jsonEncode(cardDetails);
                          print(listStr);
                          await storage.write(key: 'cards', value: listStr);
                        }
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => Home()),
                        );
                      }
                      catch(e){
                        print(e);
                      }
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
