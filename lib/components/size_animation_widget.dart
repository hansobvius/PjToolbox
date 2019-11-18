import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  final Widget child;
  SizeAnimation(this.child);
  @override
  _SizeAnimationState createState() => _SizeAnimationState();
}

class _SizeAnimationState extends State<SizeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _widthAnimation;
  Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);

    _widthAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(curve: Curves.linear, parent: _controller));

    _heightAnimation = Tween<double>(begin: 50.0, end: 250.0)
        .animate(CurvedAnimation(curve: Curves.easeInOut, parent: _controller));

    _controller.addListener(() {
      this.setState(
        () {},
      );
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * _widthAnimation.value,
      height: _heightAnimation.value,
      child: widget.child,
    );
  }
}
