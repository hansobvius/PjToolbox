import 'package:flutter/material.dart';
import 'package:pj_toolbox/components/showdown_animation_widget.dart';
import 'package:pj_toolbox/components/showup_animation_widget.dart';

import '../contants.dart';
import '../custom_page_state.dart';

class TotalTimeWidget extends StatelessWidget {
  const TotalTimeWidget(
      {Key key,
      @required CustomPageState pageState,
      @required this.totalWorkTime,
      @required this.totalPauseTime})
      : _pageState = pageState,
        super(key: key);

  final CustomPageState _pageState;
  final totalWorkTime;
  final totalPauseTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _pageState == CustomPageState.CLOCK_STOPPED
          ? ShowUpAnimation(
              child: Container(
                margin: EdgeInsets.only(top: 70.0, right: 70.0, left: 70.0),
                child: Column(
                  children: <Widget>[
                    kCaptionClockTotal,
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 33.0),
                          height: 50.0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  totalPauseTime + 'hs',
                                  style: TextStyle(
                                      color: Colors.blueGrey[100],
                                      fontSize: 18.0),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 46.0,
                                  ),
                                  child: Text(
                                    'de pausa',
                                    style: TextStyle(
                                        color: Colors.blueGrey[100],
                                        fontSize: 10.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50.0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  totalWorkTime + 'hs',
                                  style: TextStyle(
                                    color: Colors.blueGrey[100],
                                    fontSize: 18.0,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 30.0,
                                  ),
                                  child: Text(
                                    'de produção',
                                    style: TextStyle(
                                        color: Colors.blueGrey[100],
                                        fontSize: 10.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : ShowDownAnimation(
              child: Text('Total do dia\n' + totalWorkTime),
            ),
    );
  }
}
