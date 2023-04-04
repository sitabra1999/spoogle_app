
import 'package:flutter/widgets.dart';

import '../../flutter_animator.dart';

///Used by [Hinge] widget.
///Note: You can also pass this into an [InOutAnimation] widget to define the
///in/out animation.
class HingeAnimation extends AnimationDefinition {
  HingeAnimation({
    AnimationPreferences preferences = const AnimationPreferences(),
  }) : super(preferences: preferences);

  @override
  Widget build(BuildContext context, Animator animator, Widget child) {
    return FadeTransition(
      opacity: animator.get("opacity") as Animation<double>,
      child: AnimatedBuilder(
        animation: animator.controller!,
        child: child,
        builder: (BuildContext context, Widget? child) => Transform(
          transform: Perspective.matrix(4.0) *
              Matrix4.translationValues(
                  0.0, animator.get("translateY")!.value, 0.0) *
              Matrix4.rotationZ(animator.get("rotateZ")!.value),
          alignment: Alignment.topLeft,
          child: child,
        ),
      ),
    );
  }

  @override
  Map<String, TweenList> getDefinition({Size? screenSize, Size? widgetSize}) {
    const curve = Curves.easeInOut;
    return {
      "opacity": TweenList<double>(
        [
          TweenPercentage(percent: 80, value: 1.0, curve: curve),
          TweenPercentage(percent: 100, value: 0.0, curve: curve),
        ],
      ),
      "translateY": TweenList<double>(
        [
          TweenPercentage(percent: 80, value: 0.0, curve: curve),
          TweenPercentage(
              percent: 100, value: 700.0 * preferences.magnitude, curve: curve),
        ],
      ),
      "rotateZ": TweenList<double>(
        [
          TweenPercentage(percent: 0, value: 0.0, curve: curve),
          TweenPercentage(
              percent: 20,
              value: 80.0 * toRad * preferences.magnitude,
              curve: curve),
          TweenPercentage(
              percent: 40,
              value: 60.0 * toRad * preferences.magnitude,
              curve: curve),
          TweenPercentage(
              percent: 60,
              value: 80.0 * toRad * preferences.magnitude,
              curve: curve),
          TweenPercentage(
              percent: 80,
              value: 60.0 * toRad * preferences.magnitude,
              curve: curve),
          TweenPercentage(percent: 100, value: 0.0, curve: curve),
        ],
      ),
    };
  }
}

/// Example of using Hinge:
///
/// ```dart
/// class ExampleWidget extends StatelessWidget {
///
///   @override
///   Widget build(BuildContext context) {
///     return Hinge(child: Text('Bounce'));
///   }
///
/// }
/// ```
class Hinge extends AnimatorWidget {
  Hinge({
    Key? key,
    required Widget child,
    AnimationPreferences preferences = const AnimationPreferences(),
  }) : super(
            key: key,
            child: child,
            definition: HingeAnimation(preferences: preferences));
}
