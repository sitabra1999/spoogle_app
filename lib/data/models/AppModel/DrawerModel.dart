import 'package:flutter/material.dart';

class DrawerModel {
  final String title;
  final String img;
  final bool isPng;
  final Widget widget;

  DrawerModel({required this.title, required this.img, required this.isPng, required this.widget});
}