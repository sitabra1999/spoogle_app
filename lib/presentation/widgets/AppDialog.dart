import 'package:flutter_spoogle_app/presentation/libraries/AppContents/flutter_animator/flutter_animator.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';


/*
Uses:

showDialog(context: context, builder: (BuildContext context) => AppDialog(
  title: "Cancel Call Forward".toUpperCase(),
  description: "If you remove the person, username not going to receive any calls from you but all calls come to your mobile.",
  isBtn1Visible: true,
  button1Text: 'No',
  button2Text: 'Confirm',
  onPositiveBtnPressed: (){
    //Navigator.pop(context);
      setState(() {
        position = index;
        isCallForwarded = true;
      });
    },
  ),
);
*/

class AppDialog extends StatelessWidget {
  final String title, description, button1Text, button2Text;
  final bool isBtn1Visible;
  final Function() onPositiveBtnPressed;

  const AppDialog({Key? key, required this.title, required this.description, required this.button1Text,
    required this.isBtn1Visible, required this.button2Text, required this.onPositiveBtnPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    final GlobalKey<InOutAnimationState> inOutAnimation = GlobalKey<InOutAnimationState>();
    return InOutAnimation(
      key: inOutAnimation,
      inDefinition: FadeInUpAnimation(),
      outDefinition: FadeOutUpAnimation(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 30),
        margin: const EdgeInsets.only(top: 13.0,right: 8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: AppColor.primaryColor),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 0.0,
                offset: Offset(0.0, 0.0),
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                if (inOutAnimation.currentState!.status != InOutAnimationStatus.Out) {
                  inOutAnimation.currentState!.animateOut();
                  Future.delayed(const Duration(milliseconds: 500)).then((value){
                    Navigator.of(context).pop();
                  });
                } else {
                  inOutAnimation.currentState!.animateIn();
                }
              },
              child: Align(
                alignment: Alignment.topRight,
                child:  Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.cancel, size: 24, color: AppColor.secondaryColor,),
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(title, style:const TextStyle(fontSize: 16.0,color: Colors.black, fontWeight: FontWeight.bold)),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(description,
                  style:const TextStyle(fontSize: 13.0,color: Colors.black54)),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 32,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: isBtn1Visible,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child:  SizedBox(
                        //width: 60,
                        height: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0, backgroundColor: AppColor.secondaryColor,
                            side: const BorderSide(color: Colors.grey, style: BorderStyle.none,),
                          ),
                          child: Text(
                            button1Text,
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            if (inOutAnimation.currentState!.status != InOutAnimationStatus.Out) {
                              inOutAnimation.currentState!.animateOut();
                              Future.delayed(const Duration(milliseconds: 500)).then((value){
                                Navigator.of(context).pop();
                              });
                            } else {
                              inOutAnimation.currentState!.animateIn();
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    //width: 60,
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColor.secondaryColor,
                        side: const BorderSide(color: Colors.grey, style: BorderStyle.none,),
                      ),
                      child:  Text(
                        button2Text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.normal,
                          color: Colors.white,),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        onPositiveBtnPressed();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}