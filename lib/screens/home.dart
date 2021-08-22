import 'package:chainlock/widgets/custom-text.dart';
import 'package:flutter/material.dart';
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
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
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
                    onPressed: () {},
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
