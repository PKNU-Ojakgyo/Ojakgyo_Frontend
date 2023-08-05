import 'package:flutter/material.dart';

class RegisterBtn extends StatelessWidget {
  const RegisterBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {print('click')},
      child: const Text('등록'),
    );
  }
}
