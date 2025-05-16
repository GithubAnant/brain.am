import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DurationDropdown extends StatelessWidget {
  const DurationDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    required this.labelText,
    required this.options,
  });

  final int? value;
  final void Function(int?) onChanged;
  final String labelText;
  final List<int> options;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<int>(
          isExpanded: true,
          value: value,
          items: options
              .map((int val) => DropdownMenuItem<int>(
                    value: val,
                    child: Text(
                      "$val",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white70),
              borderRadius: BorderRadius.circular(4),
              color: Colors.black,
            ),
          ),
          buttonStyleData: ButtonStyleData(
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white70),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.arrow_drop_down, color: Colors.white70),
          ),
          hint: Text(
            labelText,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
