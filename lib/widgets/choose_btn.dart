import 'package:flutter/material.dart';

class ChooseBtn extends StatelessWidget {
  const ChooseBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 35,
      child: ElevatedButton(
        onPressed: () {
          print('click');
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xFF4A6C88),
        ),
        child: const Padding(
          padding: EdgeInsets.all(6),
          child: Text(
            '선택',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
