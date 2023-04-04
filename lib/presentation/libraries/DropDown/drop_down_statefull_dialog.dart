
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter_spoogle_app/presentation/widgets/txt.dart';

Future showDropDownPartiallyAvailableDialog(context, Function(String value) onClose) async {

  TextEditingController qtyController = TextEditingController();

  return await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Txt(
                    txt: 'Partially Available',
                    txtColor: AppColor.black,
                    txtSize: 16,
                    fontWeight: FontWeight.normal,
                    padding: 3,
                  ),

                  /*TxtIf(txt: 'Qty', initialTxtValue: qtyController.text, hint: 'Type here', isReadOnly: false, textInputType: TextInputType.number,
                      onSaved: (value){
                        qtyController.text = value;
                      }, leftPadding: 5,
                      rightPadding: 5,
                  ),*/


                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5, top: 24,),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(color: Colors.grey, width: 0.5),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.shade300,
                              blurRadius: 6,
                            )
                          ]
                      ),

                      alignment: Alignment.center,
                      child: const Txt(
                        txt: 'Submit',
                        txtColor: AppColor.black,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        padding: 3,
                      ),
                    ),

                    onTap: (){
                      if(qtyController.text.isEmpty) {
                        edgeAlert(context, title: 'Warning', description : 'Please enter quantity');
                      } else {
                        Navigator.pop(context);
                        onClose(qtyController.text);
                      }
                    },
                  ),

                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5, top: 24,),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(color: Colors.grey, width: 0.5),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.shade100,
                              blurRadius: 6,
                            )
                          ]
                      ),

                      alignment: Alignment.center,
                      child: const Txt(
                        txt: 'Cancel',
                        txtColor: AppColor.black,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        padding: 3,
                      ),
                    ),

                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ]
            );
          },
        ),
      );
    },
  );
}
