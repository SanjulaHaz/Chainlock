import 'package:chainlock/screens/license.dart';
import 'package:chainlock/screens/sec2.dart';
import 'package:chainlock/screens/sec1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            ThemeData(primaryColor: Color(0xffeb690b), fontFamily: "Verdana"),
        home: Sec2(),
      ),
    );
  }
}
