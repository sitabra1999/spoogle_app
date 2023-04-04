import 'package:flutter/material.dart';

class Button3d extends StatelessWidget {
  final String name;
  final IconData ic;
  final Color icColor;
  final Function onTap;
  final Color? backgroundColor;

  const Button3d({Key? key, required this.name, required this.ic, required this.icColor, required this.onTap, this.backgroundColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          InkWell(
            child: Container(
              width: 45,
              height: 45,
              margin: const EdgeInsets.only(bottom: 12, top: 6),
              decoration: BoxDecoration(
                  color: backgroundColor ?? Colors.grey.shade300,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                    const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                  ],

                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.grey.shade200,
                        Colors.grey.shade200,
                        Colors.grey.shade300,
                        Colors.grey.shade200,
                      ],
                      stops: const [
                        0.1,
                        0.3,
                        0.8,
                        1
                      ]
                  )

              ),
              child: Icon(ic, size: 20, color: icColor),
            ),

            onTap: (){
              onTap();
            },
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Text(
              name,
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}