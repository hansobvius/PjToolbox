import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class ShrinkClockAnimation extends StatefulWidget {
  ShrinkClockAnimation({this.clock, this.bottomMargin});

  final clock;
  final bottomMargin;

  @override
  _ShrinkClockAnimationState createState() => _ShrinkClockAnimationState();
}

class _ShrinkClockAnimationState extends State<ShrinkClockAnimation>
    with TickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0.7),
            from: const Duration(milliseconds: 180),
            to: const Duration(milliseconds: 400),
            tag: "fade-out")
        .addAnimatable(
            animatable: Tween<double>(begin: 40, end: 15),
            from: const Duration(milliseconds: 180),
            to: const Duration(milliseconds: 400),
            curve: Curves.easeInOutBack,
            tag: "shrink")
        .addAnimatable(
            animatable: EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 20.0, left: 105.0, right: 20.0),
                end: EdgeInsets.only(
                    bottom: widget.bottomMargin, left: 30.0, right: 0)),
            from: const Duration(milliseconds: 150),
            to: const Duration(milliseconds: 400),
//            curve: Curves.easeInOutBack,
            tag: "padding-slide")
        .animate(controller);

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
      builder: (context, child) => Container(
        padding: sequenceAnimation['padding-slide'].value,
        child: Opacity(
          opacity: sequenceAnimation['fade-out'].value,
          child: Text(
            widget.clock,
            style: TextStyle(
              color: Color(0xFFCFD8DC),
              fontSize: sequenceAnimation['shrink'].value,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
