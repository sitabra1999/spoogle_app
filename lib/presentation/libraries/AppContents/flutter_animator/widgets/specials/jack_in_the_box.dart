import 'package:flutter/widgets.dart';

import '../../flutter_animator.dart';

///Used by [JackInTheBox] widget.
///Note: You can also pass this into an [InOutAnimation] widget to define the
///in/out animation.


class JackInTheBoxAnimation extends AnimationDefinition {
  JackInTheBoxAnimation({
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
          transform: Matrix4.rotationZ(-animator.get("rotateZ")!.value) *
              Matrix4.identity().scaled(animator.get("scale")!.value),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }

  @override
  Map<String, TweenList> getDefinition({Size? screenSize, Size? widgetSize}) {
    return {
      "opacity": TweenList<double>(
        [
          const TweenPercentage(percent: 0, value: 0.0),
          const TweenPercentage(percent: 100, value: 1.0),
        ],
      ),
      "scale": TweenList<double>(
        [
          TweenPercentage(percent: 0, value: 1.0 - 0.9 * preferences.magnitude),
          const TweenPercentage(percent: 100, value: 1.0),
        ],
      ),
      "rotateZ": TweenList<double>(
        [
          TweenPercentage(
              percent: 0, value: 30.0 * toRad * preferences.magnitude),
          TweenPercentage(
              percent: 50, value: -10.0 * toRad * preferences.magnitude),
          TweenPercentage(
              percent: 70, value: 3.0 * toRad * preferences.magnitude),
          const TweenPercentage(percent: 100, value: 0.0),
        ],
      ),
    };
  }
}

/// Example of using JackInTheBox:
///
/// ```dart
/// class ExampleWidget extends StatelessWidget {
///
///   @override
///   Widget build(BuildContext context) {
///     return JackInTheBox(child: Text('Bounce'));
///   }
///
/// }
/// ```
class JackInTheBox extends AnimatorWidget {
  JackInTheBox({
    Key? key,
    required Widget child,
    AnimationPreferences preferences = const AnimationPreferences(),
  }) : super(
            key: key,
            child: child,
            definition: JackInTheBoxAnimation(preferences: preferences));
}
