import 'package:flutter_spoogle_app/presentation/journeys/HomeScreen/HomeScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../common/extensions/CommonFun.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _lottieAnimation;
  var expanded = false;
  final double _bigFontSize = kIsWeb ? 234 : 178;
  final transitionDuration = const Duration(seconds: 1);

  @override
  void initState() {
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    Future.delayed(const Duration(seconds: 1))
        .then((value) => setState(() => expanded = true))
        .then((value) => const Duration(seconds: 1))
        .then(
          (value) => Future.delayed(const Duration(seconds: 1)).then(
            (value) => _lottieAnimation.forward().then(
              (value) => Navigator.of(context)
              .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffffffff),
        width: getScreenWidth(context),
        height: getScreenHeight(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: transitionDuration,
              curve: Curves.fastOutSlowIn,
              style: TextStyle(
                color: const Color(0xffff851f),
                fontSize: !expanded ? _bigFontSize : 50,
                fontFamily: 'Poppins-Regular',
                fontWeight: FontWeight.w600,
              ),
              child: const Text(
                "C",
              ),
            ),
            AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              crossFadeState: !expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: transitionDuration,
              firstChild: Container(),
              secondChild: _logoRemainder(),
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoRemainder() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "ODE BELL",
          style: TextStyle(
            color: Color(0xffff851f),
            fontSize: 50,
            fontFamily: 'Poppins-Regular',
            fontWeight: FontWeight.w600,
          ),
        ),
        LottieBuilder.asset(
          'assets/animations/bell.json',
          onLoaded: (composition) {
            _lottieAnimation.duration = composition.duration;
          },
          frameRate: FrameRate.max,
          repeat: false,
          animate: false,
          height: 60,
          width: 45,
          controller: _lottieAnimation,
        )
      ],
    );
  }
//
// Widget _logoAbbreviated() {
//   return Container(
//     // color: Colors.blue,
//     height: 150,
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [],
//     ),
//   );
// }
//
// Widget _logoExtended() {
//   return Container(
//     height: 150,
//     child: Row(
//       // mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Expanded(
//           child: Text(
//             "HOWTIME",
//             // textAlign: TextAlign.center,
//             maxLines: 1,
//             style: Theme.of(context).textTheme.headline3!.merge(GoogleFonts.montserrat()),
//           ),
//         ),
//         LottieBuilder.asset(
//           'assets/food.json',
//           onLoaded: (composition) {
//             _lottieAnimation..duration = composition.duration;
//           },
//           frameRate: FrameRate.max,
//           repeat: false,
//           animate: false,
//           height: 100,
//           width: 100,
//           controller: _lottieAnimation,
//         )
//       ],
//     ),
//   );
// }
}