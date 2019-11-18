import 'package:flutter/cupertino.dart';
import 'package:pj_toolbox/components/showdown_animation_widget.dart';
import 'package:pj_toolbox/components/showup_animation_widget.dart';

import '../contants.dart';
import '../custom_page_state.dart';

class greetingsWidget extends StatelessWidget {
  const greetingsWidget({
    Key key,
    @required CustomPageState pageState,
  })  : _pageState = pageState,
        super(key: key);

  final CustomPageState _pageState;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80.0, left: 50.0),
      child: Container(
        height: 300,
        child: _pageState == CustomPageState.CLOCK_STARTED
            ? ShowDownAnimation(child: kGreetings)
            : ShowUpAnimation(child: kGreetings),
      ),
    );
  }
}
