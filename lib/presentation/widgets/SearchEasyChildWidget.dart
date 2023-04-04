import 'package:flutter/material.dart';

class SearchEasyChildWidget extends StatelessWidget {
  final Widget item;
  final bool isSelected;
  const SearchEasyChildWidget({Key? key, required this.item, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
        color: Colors.blue,
      ),
      const SizedBox(width: 7),
      Expanded(child: item),
    ]);
  }
}
