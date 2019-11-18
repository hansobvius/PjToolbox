import 'dart:async';
import 'package:flutter/material.dart';

class ShowUpAnimation extends StatefulWidget {
  final Widget child;
  final int delay;

  ShowUpAnimation({@required this.child, this.delay});

  @override
  _ShowUpAnimationState createState() => _ShowUpAnimationState();
}

class _ShowUpAnimationState extends State<ShowUpAnimation>
    with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.easeInOutBack, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.60), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: 50), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        textDirection: TextDirection.ltr,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}
