import 'package:flutter/widgets.dart';

import '../../flutter_animator.dart';

///Used by [SlitInVertical] widget.
///Note: You can also pass this into an [InOutAnimation] widget to define the
///in/out animation.
class SlitInVerticalAnimation extends AnimationDefinition {
  SlitInVerticalAnimation({
    AnimationPreferences preferences =
        const AnimationPreferences(duration: Duration(milliseconds: 750)),
  }) : super(preferences: preferences);

  @override
  Widget build(BuildContext context, Animator animator, Widget child) {
    return FadeTransition(
      opacity: animator.get('opacity') as Animation<double>,
      child: AnimatedBuilder(
        animation: animator.controller!,
        child: child,
        builder: (BuildContext context, Widget? child) => Transform(
          child: child,
          transform: Perspective.matrix(1.5) *
              Matrix4.translationValues(
                  0.0, 0.0, animator.get("translateZ")!.value) *
              Matrix4.rotationY(
                animator.get('rotateY')!.value,
              ),
          alignment: Alignment.center,
        ),
      ),
    );
  }

  @override
  Map<String, TweenList> getDefinition({Size? screenSize, Size? widgetSize}) {
    return {
      'opacity': TweenList<double>(
        [
          TweenPercentage(percent: 0, value: 0.0),
          TweenPercentage(percent: 54, value: 1.0),
        ],
      ),
      'translateZ': TweenList<double>(
        [
          TweenPercentage(percent: 0, value: 800.0 * preferences.magnitude),
          TweenPercentage(percent: 54, value: 160.0 * preferences.magnitude),
          TweenPercentage(percent: 100, value: 0.0),
        ],
      ),
      'rotateY': TweenList<double>(
        [
          TweenPercentage(
              percent: 0, value: -90.0 * toRad * preferences.magnitude),
          TweenPercentage(
              percent: 54, value: -87.0 * toRad * preferences.magnitude),
          TweenPercentage(percent: 100, value: 0.0),
        ],
      ),
    };
  }
}

/// Example of using SlitInVertical:
///
/// ```dart
/// class ExampleWidget extends StatelessWidget {
///
///   @override
///   Widget build(BuildContext context) {
///     return SlitInVertical(child: Text('Bounce'));
///   }
///
/// }
/// ```
class SlitInVertical extends AnimatorWidget {
  SlitInVertical({
    Key? key,
    required Widget child,
    AnimationPreferences preferences =
        const AnimationPreferences(duration: Duration(milliseconds: 750)),
  }) : super(
            key: key,
            child: child,
            definition: SlitInVerticalAnimation(preferences: preferences));
}
