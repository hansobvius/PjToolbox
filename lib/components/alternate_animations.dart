import 'package:flutter/animation.dart';

void alternateAnimations(AnimationController controller) {
  controller.status == AnimationStatus.completed
      ? controller.reverse()
      : controller.forward();
}
