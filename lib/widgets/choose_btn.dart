import 'package:flutter/material.dart';

class ChooseBtn extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isNotChooseBtn;

  const ChooseBtn({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isNotChooseBtn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isNotChooseBtn ? 140 : 90,
      height: isNotChooseBtn ? 33 : 35,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: isNotChooseBtn
                ? BorderRadius.circular(10)
                : BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xFF4A6C88),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isNotChooseBtn ? FontWeight.w500 : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
