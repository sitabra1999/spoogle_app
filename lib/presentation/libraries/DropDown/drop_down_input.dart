import 'package:flutter/material.dart';

/* How to use it
AppDropdownInput(
  hintText: "", //leave empty to hide text on border
  options: const ["Sort", 'Oldest', 'Newest'],
  value: 'Sort',
  onChanged: (String? value) {
    setState(() {
      sortStr = value!;
      // state.didChange(newValue);
    });
  },
  getLabel: (String value) => value,
),

*/
class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T value;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;

  const AppDropdownInput({Key? key,
    this.hintText = 'Please select an Option',
    this.options = const [],
    required this.getLabel,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            labelText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            hintStyle: const TextStyle(color: Colors.grey,),
            fillColor: Colors.white,
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isDense: true,
              onChanged: onChanged,
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(getLabel(value),
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}