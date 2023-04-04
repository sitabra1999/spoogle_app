import 'package:flutter/material.dart';

tabWidget(String title, IconData ic){
  return Tab(
    icon: Icon(ic),
    iconMargin: const EdgeInsets.only(left: 24.0, right: 24, bottom: 6),
    child: Text(title, style: const TextStyle(fontSize: 14,),),
  );
}