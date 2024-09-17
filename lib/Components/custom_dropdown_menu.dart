import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final InputDecoration? decoration;
  final Widget hint;
  final Widget icon;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.decoration,
    required this.icon,
    required this.hint,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: widget.icon,
      hint: widget.hint,
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
