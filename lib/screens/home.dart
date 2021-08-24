import 'package:chainlock/screens/qr.dart';
import 'package:chainlock/widgets/custom-text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChainLock"),
        leading: IconButton(
          icon: Icon(
            Icons.dehaze,
            color: Colors.white,
          ),
          onPressed: () {
            if (scaffoldkey.currentState.isDrawerOpen == false) {
              scaffoldkey.currentState.openDrawer();
            } else {
              scaffoldkey.currentState.openEndDrawer();
            }
            ;
          },
        ),
      ),
      body: Scaffold(
        key: scaffoldkey,
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                tileColor: Color(0xffe0e0e0),
                title: Text(
                  "My Cards",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.credit_card_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              ListTile(
                title: Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.settings,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: Image.network(
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/BTC_Logo.svg/183px-BTC_Logo.svg.png"),
                                  width: ScreenUtil().setWidth(80),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(30),
                                ),
                                CustomText(
                                  text: "BTC",
                                  isBold: true,
                                  size: ScreenUtil().setSp(35),
                                ),
                                Expanded(child: SizedBox()),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      text: "102457845769845",
                                      size: ScreenUtil().setSp(22),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil().setHeight(8),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "0 ",
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(45),
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "sat",
                                              style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(40),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil().setHeight(8),
                                    ),
                                    CustomText(
                                      text: "~0.00 €",
                                      color: Color(0xff697378),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       SizedBox(
            //         width: ScreenUtil().setWidth(500),
            //         child: Image.asset("assets/no_cards.png"),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.all(ScreenUtil().setHeight(25)),
            //         child: CustomText(
            //           text: "No Cards Added",
            //           color: Color(0xff697378),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(60)),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      size: ScreenUtil().setSp(30),
                      text: "Check the security features or add a card",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(30)),
                    child: Icon(
                      Icons.arrow_forward,
                      size: ScreenUtil().setHeight(60),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => QRScreen()),
                      );
                    },
                    child: Icon(Icons.add_rounded),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
