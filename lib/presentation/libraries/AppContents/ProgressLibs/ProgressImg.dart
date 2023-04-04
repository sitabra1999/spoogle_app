import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/flutter_animator/flutter_animator.dart';

class ProgressImage extends StatelessWidget {
  final Color cardBgColor;
  final double cardElevation;
  final double extendSize;

  const ProgressImage({Key? key, required this.cardBgColor, required this.cardElevation, required this.extendSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ZoomIn(
        child: Card(
          color: cardBgColor,
          elevation: cardElevation,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          //shadowColor: Colors.orange.shade100,
          child: Stack(
            alignment : AlignmentDirectional.center,
            children: [
              Container(
                margin: const EdgeInsets.all(24),
                width: 70 + extendSize,
                height: 70 + extendSize,
                child: CircularProgressIndicator(
                  backgroundColor: AppColor.appLogoColor.withOpacity(0.1),
                  color: AppColor.appLogoColor,
                ),
              ),

              Image.asset(
                'assets/images/app/app_logo.png',
                fit: BoxFit.contain,
                width: 40 + extendSize,
                height: 40 + extendSize,
              ),
            ],
          ),
        ),
      ),
    );
  }

}