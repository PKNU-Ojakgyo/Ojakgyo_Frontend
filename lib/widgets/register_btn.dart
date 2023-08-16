import 'package:flutter/material.dart';

class RegisterBtn extends StatelessWidget {
  const RegisterBtn({
    Key? key,
    required this.btnName,
    required this.onPressed,
    required this.isModal,
  }) : super(key: key);

  final String btnName;
  final VoidCallback onPressed;
  final bool isModal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isModal ? 80 : 120,
      height: isModal ? 35 : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xFF23225C),
        ),
        child: Padding(
          padding: isModal ? const EdgeInsets.all(4) : const EdgeInsets.all(10),
          child: Text(
            btnName,
            style: TextStyle(
              fontSize: isModal ? 13 : 16,
              fontWeight: isModal ? FontWeight.w500 : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
