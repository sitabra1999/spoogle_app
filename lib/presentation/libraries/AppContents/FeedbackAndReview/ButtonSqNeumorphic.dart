import 'package:flutter/material.dart';

class ButtonSqNeumorphic extends StatelessWidget {
  final Function onTap;
  const ButtonSqNeumorphic({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        //width: 100,
        height: 40,
        margin: const EdgeInsets.only(bottom: 3),
        decoration: BoxDecoration(
          //color: Colors.deepOrangeAccent,
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 8.0,
            ),
            BoxShadow(
              color: Colors.black12,
              offset: Offset(4.0, 4.0),
              blurRadius: 8.0,
            ),
          ],
          color: const Color(0xFFFD9034),
          borderRadius: BorderRadius.circular(6.0),
            /*gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey.shade200,
                  Colors.grey.shade300,
                  Colors.grey.shade400,
                  Colors.grey.shade500,
                ],
                stops: [
                  0.1,
                  0.3,
                  0.8,
                  1
                ]
            )*/
        ),
        child: const Center(
          child: Text("Sure! Let's Begin", textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),),
        ),
      ),
      onTap: (){
        onTap();
      },
    );
  }
}
