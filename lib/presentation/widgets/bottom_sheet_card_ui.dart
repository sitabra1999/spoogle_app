import 'package:flutter/material.dart';

import '../../data/models/RegisterFormDetailsApiModel.dart';

showBottomSheetCardUi(BuildContext context, List<DocumentType> docList, Function(String cardName, String cardId) onClose) {
  showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
          return Container(
            height: 250,
            padding: const EdgeInsets.only(bottom: 26, left: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 24,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Select Document",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black87),
                  ),
                ),

                Container(
                  height: 150,
                  padding: const EdgeInsets.only(top: 6, left: 24, right: 24),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: docList.length,
                    shrinkWrap: false,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 45,
                    ),
                    itemBuilder: (_, index) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 3, primary: Colors.orange),
                        child:  Text(docList[index].documentName!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),),
                        onPressed: () {
                          onClose(docList[index].documentName!, docList[index].id!.toString(), );
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),

                /*Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(elevation: 3, primary: Colors.orange),
                          onPressed: () {
                            onClose('Passport');
                            Navigator.pop(context);
                          },
                          child: const SizedBox(
                            width: 120,
                            child: Text('Passport',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),),
                          ),
                        )
                      ),

                      Flexible(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(elevation: 3, primary: Colors.orange),
                            onPressed: () {
                              onClose('Voter Id');
                              Navigator.pop(context);
                            },
                            child: const SizedBox(
                              width: 120,
                              child: Text('Voter Id',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),),
                            ),
                          )
                      ),
                    ],
                  ),
                ),*/

              ],
            ),
          );
        });
      });
}