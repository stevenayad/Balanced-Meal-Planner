import 'package:flutter/material.dart';

class HeightInputField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final String suffixText;

  const HeightInputField({
    super.key,
    required this.controller,
    this.onChanged,
    required this.hintText,
    this.suffixText = '',
  });

  @override
  State<HeightInputField> createState() => _HeightInputFieldState();
}

class _HeightInputFieldState extends State<HeightInputField> {
  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focused) => setState(() => _hasFocus = focused),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,

        decoration: InputDecoration(
          hintText:
              !_hasFocus && widget.controller.text.isEmpty
                  ? widget.hintText
                  : null,
          suffix: Text(
            widget.suffixText,
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        onChanged: (value) {
          setState(() {});
          widget.onChanged?.call(value);
        },
      ),
    );
  }
}
