import 'package:flutter/material.dart';
import 'package:pj_toolbox/components/showup_animation_widget.dart';
import 'package:pj_toolbox/components/shrink_clock_animation.dart';
import 'package:pj_toolbox/components/time_helper.dart';
import '../contants.dart';
import '../custom_page_state.dart';

class Clock1 extends StatelessWidget {
  const Clock1({
    Key key,
    @required CustomPageState pageState,
    @required this.controller,
  })  : _pageState = pageState,
        super(key: key);

  final CustomPageState _pageState;
  final AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return TimeFormater(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _pageState == CustomPageState.CLOCK_STARTED
          ? ShowUpAnimation(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, Widget child) {
                          return Text(
                            timerString,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                    kCaptionClock1
                  ],
                ),
              ),
            )
          : ShrinkClockAnimation(
              clock: timerString,
              bottomMargin: 150.0,
            ),
    );
  }
}
