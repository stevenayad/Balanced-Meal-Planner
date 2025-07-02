import 'package:flutter/material.dart';

class GenderInputField extends StatefulWidget {
  final ValueChanged<String>? onGenderSelected;
  final String? initialValue;

  const GenderInputField({super.key, this.onGenderSelected, this.initialValue});

  @override
  State<GenderInputField> createState() => _GenderInputFieldState();
}

class _GenderInputFieldState extends State<GenderInputField> {
  late TextEditingController _controller;
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.initialValue;
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateGender(String gender) {
    setState(() {
      _selectedGender = gender;
      _controller.text = gender;
    });
    widget.onGenderSelected?.call(gender);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        TextFormField(
          controller: _controller,
          readOnly: true,
          onTap: () {
        
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            suffixIcon: PopupMenuButton<String>(
              icon: const Icon(Icons.arrow_drop_down),
              onSelected: (gender) {
                _updateGender(gender);
              },
              itemBuilder: (context) {
                return ['Male', 'Female'].map((gender) {
                  return PopupMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList();
              },
            ),
            hintText: 'Select Gender',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
