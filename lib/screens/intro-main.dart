import 'package:chainlock/screens/intro2.dart';
import 'package:chainlock/screens/license.dart';
import 'package:chainlock/widgets/custom-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro1.dart';
import 'intro2.dart';
import 'intro3.dart';

class IntroMain extends StatefulWidget {
  const IntroMain({Key key}) : super(key: key);

  @override
  _IntroMainState createState() => _IntroMainState();
}

class _IntroMainState extends State<IntroMain> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Intro1(controller: _controller),
              Intro2(controller: _controller,),
              Intro3()
            ],
          ),
          Column(
            children: [
              Expanded(flex: 4,child: SizedBox.shrink()),
              Center(
                child: SmoothPageIndicator(
                    controller: _controller,
                    count:  3,
                    effect:  WormEffect(
                      activeDotColor: Theme.of(context).accentColor,
                      dotColor:  Theme.of(context).accentColor,
                      paintStyle: PaintingStyle.stroke,
                      dotHeight: 8,
                      dotWidth: 8
                    ),
                    onDotClicked: (index){
                      _controller.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                    }
                ),
              ),
              Expanded(flex: 6,child: SizedBox.shrink()),
            ],
          ),
        ],
      ),
    );
  }
}
