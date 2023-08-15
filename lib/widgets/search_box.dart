import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final List<String> category = ['아이디', '주소'];

  String? selectedCategory = '아이디';

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
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                DropdownButton(
                  value: selectedCategory,
                  items: category.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  underline: Container(),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          const Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                print("click");
              },
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
