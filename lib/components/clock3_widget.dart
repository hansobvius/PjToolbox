import 'package:flutter/material.dart';
import 'package:pj_toolbox/components/showup_animation_widget.dart';
import 'package:pj_toolbox/components/shrink_clock_animation.dart';
import 'package:pj_toolbox/components/time_helper.dart';
import '../contants.dart';
import '../custom_page_state.dart';

class Clock3Widget extends StatelessWidget {
  const Clock3Widget({
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
    return Container(
      child: _pageState == CustomPageState.CLOCK_RESTARTED
          ? ShowUpAnimation(
              child: Container(
//                margin: EdgeInsets.only(top: 100.0, right: 20.0, left: 70.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
//                      margin: EdgeInsets.only(right: 65.0),
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          return Text(
                            timerString,
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                    kCaptionClock3
                  ],
                ),
              ),
            )
          : ShrinkClockAnimation(
              clock: timerString,
              bottomMargin: 30.0,
            ),
    );
  }
}
