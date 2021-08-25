import 'dart:convert';

import 'package:chainlock/widgets/custom-text.dart';
import 'package:chainlock/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'home.dart';

class Congratulations extends StatelessWidget {
  final Map cardDetails;

  const Congratulations({Key key, this.cardDetails}) : super(key: key);
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
                          text:
                              "The check of your chainlock card has been completed",
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
                        text: cardDetails['cardNo'],
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
                        text: cardDetails['address'],
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
                onPressed: () async {
                  try{
                    final storage = FlutterSecureStorage();
                    String cards = await storage.read(key: 'cards');
                    if(cards!=null){
                      List fetchedCards = cards.split(';');

                      ///check if card exists
                      if(fetchedCards.contains(jsonEncode(cardDetails))){
                        ToastBar(text: 'Card Already Added!',color: Colors.red).show();
                      }
                      else{
                        fetchedCards.add(jsonEncode(cardDetails));
                        String listStr = "";
                        fetchedCards.forEach((element) {
                          listStr += element+";";
                        });
                        print(listStr);
                        await storage.write(key: 'cards', value: listStr.substring(0, listStr.length - 1));
                      }
                    }
                    else{
                      String listStr = jsonEncode(cardDetails);
                      print(listStr);
                      await storage.write(key: 'cards', value: listStr);
                    }
                    Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) =>
                        Home()), (Route<dynamic> route) => false);
                  }
                  catch(e){
                    ToastBar(text: 'Something went wrong! '+e.toString(),color: Colors.red).show();
                  }
                },
                child: Text("Save Card"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
