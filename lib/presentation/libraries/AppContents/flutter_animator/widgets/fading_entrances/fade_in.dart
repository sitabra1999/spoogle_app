import 'package:flutter/widgets.dart';

import '../../flutter_animator.dart';

//Used by [FadeIn] widget.
//Note: You can also pass this into an [InOutAnimation] widget to define the
///in/out animation.

class FadeInAnimation extends AnimationDefinition {
  FadeInAnimation({
    AnimationPreferences preferences = const AnimationPreferences(),
  }) : super(preferences: preferences);

  @override
  Widget build(BuildContext context, Animator animator, Widget child) {
    return FadeTransition(
      opacity: animator.get("opacity") as Animation<double>,
      child: child,
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
    };
  }
}

/// Example of using FadeIn:
///
/// ```dart
/// class ExampleWidget extends StatelessWidget {
///
///   @override
///   Widget build(BuildContext context) {
///     return FadeIn(child: Text('Bounce'));
///   }
///
/// }
/// ```
class FadeIn extends AnimatorWidget {
  FadeIn({
    Key? key,
    required Widget child,
    AnimationPreferences preferences = const AnimationPreferences(),
  }) : super(
            key: key,
            child: child,
            definition: FadeInAnimation(preferences: preferences));
}
