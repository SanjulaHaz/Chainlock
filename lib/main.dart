import 'package:chainlock/screens/sec-main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/sec-main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(720, 1560),
      builder: () => MaterialApp(
        theme:
            ThemeData(
                primaryColor: Color(0xffeb690b),
                accentColor: Color(0xff616161),
                fontFamily: "Verdana"
            ),
        home: SecMain(),
      ),
    );
  }
}
