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
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
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
              width: 10,
            ),
            const Expanded(
              flex: 2,
              child: TextField(),
            ),
          ],
        ),
      ],
    );
  }
}
