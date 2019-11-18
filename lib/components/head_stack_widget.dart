import 'package:flutter/cupertino.dart';
import 'package:pj_toolbox/components/total_time_widget.dart';

import '../custom_page_state.dart';
import 'clock1_wdget.dart';
import 'clock2_widget.dart';
import 'clock3_widget.dart';
import 'greetings_widget.dart';

class HeadStackWidget extends StatelessWidget {
  const HeadStackWidget({
    Key key,
    @required CustomPageState pageState,
    @required this.fadeInClock1Animation,
    @required AnimationController controllerCountTimer1,
    @required this.fadeInClock2Animation,
    @required AnimationController controllerCountTimer2,
    @required this.fadeInClock3Animation,
    @required AnimationController controllerCountTimer3,
    @required this.fadeInClockTotalAnimation,
    @required this.pauseTime,
    @required this.totalTime,
  })  : _pageState = pageState,
        _controllerCountTimer1 = controllerCountTimer1,
        _controllerCountTimer2 = controllerCountTimer2,
        _controllerCountTimer3 = controllerCountTimer3,
        super(key: key);

  final CustomPageState _pageState;
  final Animation<double> fadeInClock1Animation;
  final AnimationController _controllerCountTimer1;
  final Animation<double> fadeInClock2Animation;
  final AnimationController _controllerCountTimer2;
  final Animation<double> fadeInClock3Animation;
  final AnimationController _controllerCountTimer3;
  final Animation<double> fadeInClockTotalAnimation;
  final String pauseTime;
  final String totalTime;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _pageState == CustomPageState.APP_STARTED ||
                _pageState == CustomPageState.CLOCK_STARTED
            ? greetingsWidget(pageState: _pageState)
            : Container(),
        //Primeiro relógio
        Container(
          margin: EdgeInsets.only(top: 20.0, right: 20.0),
          child: AnimatedOpacity(
            opacity: fadeInClock1Animation.value,
            duration: Duration(milliseconds: 500),
            child: Clock1(
              pageState: _pageState,
              controller: _controllerCountTimer1,
            ),
          ),
        ),
        //Segundo Relógio
        Container(
          margin: EdgeInsets.only(top: 20.0, right: 20.0),
          child: AnimatedOpacity(
            opacity: fadeInClock2Animation.value,
            duration: Duration(milliseconds: 500),
            child: Center(
              child: Clock2Widget(
                  pageState: _pageState, controller: _controllerCountTimer2),
            ),
          ),
        ),
        //Terceiro Relógio
        Container(
          margin: EdgeInsets.only(top: 20.0, right: 20.0),
          child: AnimatedOpacity(
            opacity: fadeInClock3Animation.value,
            duration: Duration(milliseconds: 500),
            child: Center(
              child: Clock3Widget(
                  pageState: _pageState, controller: _controllerCountTimer3),
            ),
          ),
        ),
        //Total de horas do dia
        Container(
          margin: EdgeInsets.only(top: 20.0, right: 10.0),
          child: Opacity(
            opacity: fadeInClockTotalAnimation.value,
            child: Center(
              child: TotalTimeWidget(
                pageState: _pageState,
                totalPauseTime: pauseTime,
                totalWorkTime: totalTime,
//                                  totalPauseTime: '1:08',
//                                  totalWorkTime: '8:46',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
