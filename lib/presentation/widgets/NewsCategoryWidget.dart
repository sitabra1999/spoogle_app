import 'package:flutter/material.dart';
class NewsCategoryWidget extends StatelessWidget {
  final double? height;
  final double? corner;
  final double? boxSpace;
  final double? textSpace;
  final List<String>? list;
  final String? sportId;
  final Function(String)? onTap;

  const NewsCategoryWidget({Key? key, required this.height, this.corner, this.boxSpace, this.textSpace, this.list, this.onTap, this.sportId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list?.length??0,
          itemBuilder: (_,i){
          if(sportId=='blank' && i==0){
            return Container();
          }
          if(sportId=='' && i==0){
            return  InkWell(
              onTap: (){
                if(onTap!=null){
                  onTap!(list?[i]??'');
                }
              },
              child: Container(
                //width: 106,
                height: height ?? 16,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: textSpace ?? 6, right: textSpace ?? 6),
                margin: EdgeInsets.only(top: 1, right: boxSpace ?? 5, bottom: 3),
                decoration: BoxDecoration(
                  color: sportId==''?(i == 0 ? Colors.blue : Colors.red):Colors.red,
                  // color: i == 1 ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(corner ?? 2)),
                  //border: Border.all(color: Colors.grey.shade300, width: 0.9),
                ),

                child: Text(
                  list?[i]??'',
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 10, color: Colors.white),
                ),
              ),
            );
          }
          return InkWell(
            onTap: (){
              if(onTap!=null){
                onTap!(list?[i]??'');
              }
            },
            child: Container(
              //width: 106,
              height: height ?? 16,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: textSpace ?? 6, right: textSpace ?? 6),
              margin: EdgeInsets.only(top: 1, right: boxSpace ?? 5, bottom: 3),
              decoration: BoxDecoration(
                color: sportId==''?(i == 0 ? Colors.blue : Colors.red):Colors.red,
                // color: i == 1 ? Colors.red : Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(corner ?? 2)),
                //border: Border.all(color: Colors.grey.shade300, width: 0.9),
              ),

              child: Text(
                list?[i]??'',
                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 10, color: Colors.white),
              ),
            ),
          );
      }),
    );
  }
}
