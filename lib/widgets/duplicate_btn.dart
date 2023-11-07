import 'package:flutter/material.dart';

class DuplicateBtn extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isNotChooseBtn;

  const DuplicateBtn({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isNotChooseBtn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 35,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color(0xFF4A6C88),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
