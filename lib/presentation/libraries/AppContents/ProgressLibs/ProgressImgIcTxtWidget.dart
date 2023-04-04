import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/flutter_animator/flutter_animator.dart';

class ProgressImgIcTxtWidget extends StatelessWidget {
  final Color cardBgColor;
  final double cardElevation;
  final double extendSize;
  final IconData? ic;
  final String loadingText;

  const ProgressImgIcTxtWidget({Key? key, required this.cardBgColor, required this.cardElevation, required this.extendSize,
    this.ic, required this.loadingText}) : super(key: key);

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
          child: SizedBox(
            height: 180,
            width: 220,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment : AlignmentDirectional.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(24),
                      width: extendSize + 50,
                      height: extendSize + 50,
                      child: CircularProgressIndicator(
                        backgroundColor: AppColor.appLogoColor.withOpacity(0.1),
                        color: AppColor.appLogoColor,
                      ),
                    ),

                    Icon(ic, color: Colors.black, size: 35,),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    loadingText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}