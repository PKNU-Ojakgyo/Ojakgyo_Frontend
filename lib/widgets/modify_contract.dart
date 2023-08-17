import 'package:flutter/material.dart';

class ModifyContract extends StatefulWidget {
  const ModifyContract({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<ModifyContract> createState() => _ModifyContractState();
}

class _ModifyContractState extends State<ModifyContract> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFD9D9D9),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: widget.controller,
              maxLines: 10,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
