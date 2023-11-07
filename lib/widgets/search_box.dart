import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onPressed,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final VoidCallback onPressed;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(221, 53, 53, 53),
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 3,
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
            ),
          ),
          IconButton(
              onPressed: widget.onPressed,
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Color.fromARGB(221, 53, 53, 53),
              ))
        ],
      ),
    );
  }
}
