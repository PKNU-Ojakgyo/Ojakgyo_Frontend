import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/search_box.dart';

class InquiryLockerModal extends StatefulWidget {
  const InquiryLockerModal({super.key});

  @override
  State<InquiryLockerModal> createState() => _InquiryLockerModalState();
}

class _InquiryLockerModalState extends State<InquiryLockerModal> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(23),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.close,
                          size: 30,
                          color: Color.fromARGB(221, 53, 53, 53),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    "락커 조회하기",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(221, 21, 21, 21),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Material(
                    child: SearchBox(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
