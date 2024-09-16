import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final InputDecoration? decoration;
  final String? initialValue;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.decoration,
    required this.initialValue,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ??
        widget
            .items[0]; // Default to first item if no initial value is provided
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text('Prefix'),
      decoration: widget.decoration ??
          const InputDecoration(), // Use passed decoration or a default one
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
        widget.onChanged(newValue); // Call the onChanged callback
      },
    );
  }
}
