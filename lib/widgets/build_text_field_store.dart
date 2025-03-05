import 'package:flutter/material.dart';

Widget buildTextField(TextEditingController controller, String label,
    {bool isNumeric = false, int maxLines = 1}) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
      ));
}
