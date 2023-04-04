import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../themes/app_color.dart';
import 'FlutterPhoenix/flutter_phoenix.dart';

//How to use
/*ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
  return RedScreen(onReload: (){
    Phoenix.rebirth(context);
  },);
};*/

//This screen is replaced screen of default error red screen
class RedScreen extends StatelessWidget {

  const RedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/something_wrong.json', width: getScreenWidth(context), height: 300,),
            const Text(
              'Error!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColor.primaryColor),
              maxLines: 4,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),

            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Something went wrong.\nPlease try again.',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black54),
                maxLines: 4,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: OutlinedButton(
                onPressed: (){
                  Phoenix.rebirth(context);
                },
                style: ButtonStyle(
                  //minimumSize: MaterialStateProperty.all(const Size(50, 30)),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 55)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.all(Colors.orange.shade50),
                  elevation: MaterialStateProperty.all(6),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                  ),
                ),
                child: Text('Reload',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey.shade600),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}