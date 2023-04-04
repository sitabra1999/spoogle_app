
import 'package:flutter_spoogle_app/data/models/AppModel/DialogListModel.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/TranslationConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import '../../common/constants/size_constants.dart';

/*uses:
List<String> dataList = ['Luna','Oberon','Phobos','Rose','Sunset','Wood'];
List<DialogListModel> dialogListModel = [];
for(int i =0; i<dataList.length; i++){
  dialogListModel.add(DialogListModel(i.toString(), dataList[i], dataList[i],));
}
showDropDownLisRadioBtn(context, 'City', dialogListModel, (value, index){
  print('---- Dialog selected value: $value');
});
*/

int radioIndex = 0;
void showDropDownLisRadioBtn(BuildContext context, String title, String btn2Txt, List<DialogListModel> dataList,
    Function(String value, int index) onPositiveBtn) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState2) {
            return AlertDialog(
              //titlePadding: EdgeInsets.all(12),
              title: Container(
                padding: const EdgeInsets.only(
                  bottom: 12, // Space between underline and text
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1, // Underline thickness
                    ))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                          fontSize: 18
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        '${TranslationConstants.pleaseSelectThe.t(context)}${title.toLowerCase()}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              content: SizedBox(
                width: double.maxFinite,
                //height: 150,
                child: dataList.isNotEmpty?
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      activeColor: AppColor.primaryColor,
                      value: index,
                      groupValue: radioIndex,
                      title: Text(dataList[index].title,
                        style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal,),),
                      onChanged: (val) {
                        setState2(() {
                          radioIndex = index;
                        });
                      },
                    );
                  },
                ): Center(
                  child: Text(TranslationConstants.noDataFound.t(context),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.normal, wordSpacing: 0),
                  ),
                ),
              ),

              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                  child: const Text("Cancel", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),),
                ),
                TextButton(
                  onPressed: () {
                    onPositiveBtn(dataList[radioIndex].subtitle, radioIndex);
                    Navigator.pop(context);
                  },
                  child: Text("$btn2Txt  ", style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),),
                ),
              ],
            );
          },
        );
      });
}