import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final TextInputType keyboardType;
  final bool isRequired;
  final bool isPassword;
  final bool isEnabled;
  final Function(String)? onChangedCallback;
  final String? Function(String?)? validator;

  const GlobalTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    this.keyboardType = TextInputType.text,
    required this.isRequired,
    required this.isPassword,
    required this.isEnabled,
    required this.onChangedCallback,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            children:
                isRequired
                    ? [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ]
                    : [],
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          enabled: isEnabled,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          validator: validator,
          obscureText: isPassword,
          onChanged: onChangedCallback,
        ),
      ],
    );
  }
}
