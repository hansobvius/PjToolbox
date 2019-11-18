import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class ShowDownAnimation extends StatefulWidget {
  ShowDownAnimation({this.child});

  final Widget child;

  @override
  _ShowDownAnimationState createState() => _ShowDownAnimationState();
}

class _ShowDownAnimationState extends State<ShowDownAnimation>
    with TickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            from: const Duration(milliseconds: 180),
            to: const Duration(milliseconds: 400),
            tag: "fade-out")
        .addAnimatable(
            animatable: EdgeInsetsTween(
                begin: EdgeInsets.only(top: 0, left: 0.0),
                end: EdgeInsets.only(top: 200.0)),
            from: const Duration(milliseconds: 150),
            to: const Duration(milliseconds: 450),
            tag: "padding-slide")
        .animate(controller);

    if (controller.isCompleted)
      controller.reverse();
    else
      controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Opacity(
        opacity: sequenceAnimation['fade-out'].value,
        child: Container(
          padding: sequenceAnimation['padding-slide'].value,
          child: widget.child,
//                margin: EdgeInsets.only(
//                    left: sequenceAnimation['margin-slide'].value),
//                height: sequenceAnimation['grow'].value,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
