import 'package:flutter/material.dart';
import 'package:pj_toolbox/components/showup_animation_widget.dart';
import 'package:pj_toolbox/components/shrink_clock_animation.dart';
import 'package:pj_toolbox/components/time_helper.dart';
import '../contants.dart';
import '../custom_page_state.dart';

class Clock2Widget extends StatelessWidget {
  const Clock2Widget({
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
      child: _pageState == CustomPageState.PAUSE_STARTED
          ? ShowUpAnimation(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
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
                    kCaptionClock2
                  ],
                ),
              ),
            )
          : ShrinkClockAnimation(
              clock: timerString,
              bottomMargin: 90.0,
            ),
    );
  }
}
