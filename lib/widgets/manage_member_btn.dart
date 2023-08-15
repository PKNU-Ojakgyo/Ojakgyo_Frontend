import 'package:flutter/material.dart';

class ManageMemberBtn extends StatelessWidget {
  const ManageMemberBtn({
    Key? key,
    required this.btnName,
    required this.onPressed,
  }) : super(key: key);

  final String btnName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xFF23225C),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            btnName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
