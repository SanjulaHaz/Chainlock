import 'dart:convert';

import 'package:chainlock/screens/qr.dart';
import 'package:chainlock/widgets/custom-text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  List fetchedCards;

  getCards() async {
    final storage = FlutterSecureStorage();
    String cards = await storage.read(key: 'cards');
    if(cards!=null){
      setState(() {
        fetchedCards = cards.split(';');
      });
    }
    else{
      setState(() {
        fetchedCards = [];
      });
    }
  }

  getDetails(Map cardDetails) async {
      try{
        String url = "https://api.chainlock.com/api/v1/balances";
        var response = await http.post(
            Uri.parse(url),
            headers: {
              "X-API-KEY": cardDetails['clcHash'],
              "Content-Type": "application/json"
            },
            body: jsonEncode(
                {
                  "address": cardDetails['address'],
                  "cryptoCurrency": cardDetails['crypto'],
                  "fiatCurrency": "EUR"
                }
              )
        );
        print(response.statusCode);
        if(response.statusCode==200){
          var body = jsonDecode(response.body);
          print(body);
          return body;
        }
        else{
          return {'status': "ERROR"};
        }
      }
      catch(e){
        print(e);
        return {'status': "ERROR"};
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCards();
  }
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
            if (scaffoldKey.currentState.isDrawerOpen == false) {
              scaffoldKey.currentState.openDrawer();
            } else {
              scaffoldKey.currentState.openEndDrawer();
            }
            ;
          },
        ),
      ),
      body: Scaffold(
        key: scaffoldKey,
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
            if(fetchedCards!=null&&fetchedCards.length>0)
            Expanded(
              child: fetchedCards!=null?ListView.builder(
                itemCount: fetchedCards.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, i){
                  Map cardDetails = jsonDecode(fetchedCards[i]);

                  return FutureBuilder(
                    future: getDetails(cardDetails),
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        String logo = snapshot.data['logo'];
                        double cryptoBalance = double.parse(snapshot.data['cryptoBalance'].toString());
                        double fiatBalance = double.parse(snapshot.data['fiatBalance'].toString());

                        return Padding(
                          padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20),ScreenUtil().setWidth(20),ScreenUtil().setWidth(20),0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: Image.network(logo),
                                        width: ScreenUtil().setWidth(80),
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(30),
                                      ),
                                      CustomText(
                                        text: cardDetails['crypto'],
                                        isBold: true,
                                        size: ScreenUtil().setSp(35),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          CustomText(
                                            text: cardDetails['cardNo'],
                                            size: ScreenUtil().setSp(22),
                                          ),
                                          SizedBox(
                                            height: ScreenUtil().setHeight(8),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: cryptoBalance.toString()+" ",
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
                                            text: "~$fiatBalance €",
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
                        );
                      }
                      else{
                        return Center(child: SizedBox.shrink(),);
                      }
                    },
                  );
                },
              ):Center(child: CircularProgressIndicator(),),
            ),

            if(fetchedCards!=null&&fetchedCards.length==0)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(500),
                    child: Image.asset("assets/no_cards.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(25)),
                    child: CustomText(
                      text: "No Cards Added",
                      color: Color(0xff697378),
                    ),
                  )
                ],
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
