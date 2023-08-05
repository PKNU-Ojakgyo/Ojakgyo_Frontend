import 'package:flutter/material.dart';

class RegisterBtn extends StatelessWidget {
  const RegisterBtn({
    Key? key,
    required this.btnName,
  }) : super(key: key);

  final String btnName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {print('click')},
      child: Text(btnName),
    );
  }
}
