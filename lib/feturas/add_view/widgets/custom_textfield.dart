// ignore: file_names
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    required this.hint,
    required this.controller,
    required this.icon,
    this.isRequired = false, // 👈 جديد
  });

  final String hint;
  final TextEditingController controller;
  final Icon icon;
  final bool isRequired;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.isRequired
            ? (String? v) {
                if (v == null || v.isEmpty) {
                  return "please write your ${widget.hint}";
                }
                return null;
              }
            : null, // 👈 لو مش required مفيش validation

        cursorColor: Colors.white,
        cursorHeight: 14,

        style: const TextStyle(color: Colors.white, fontSize: 16, height: 1.2),

        decoration: InputDecoration(
          isDense: true,
          labelText: widget.hint,
          labelStyle: const TextStyle(color: Colors.white, fontSize: 16),
          suffixIcon: widget.icon,

          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),

          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 25,
          ),

          filled: true,
          fillColor: const Color(0xFF1E2A38).withOpacity(0.6),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.25),
              width: 1.5,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.6),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
