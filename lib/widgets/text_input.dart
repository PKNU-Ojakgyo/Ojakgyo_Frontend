import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
    required this.textType,
    required this.hintText,
    required this.isDefault,
    required this.controller,
    this.textInputType = TextInputType.text,
    // this.defaultValue = '',
  }) : super(key: key);

  final String textType;
  final String hintText;
  final bool isDefault;
  final TextEditingController controller;
  final TextInputType textInputType;
  // final String defaultValue;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        style: TextStyle(
          color: widget.isDefault
              ? const Color.fromARGB(255, 77, 77, 77)
              : Colors.black,
        ),
        keyboardType: widget.textInputType,
        enabled: !widget.isDefault,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD8E8E9),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD8E8E9),
            ),
          ),
          hoverColor: Colors.transparent,
          labelText: widget.textType,
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD8E8E9),
            ),
          ),
        ),
      ),
    );
  }
}
