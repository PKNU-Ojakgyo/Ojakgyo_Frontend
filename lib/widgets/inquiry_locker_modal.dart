import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

import 'package:ojakgyo/widgets/search_box.dart';
import 'package:ojakgyo/widgets/locker_list.dart';

// import 'package:ojakgyo/src/services/auth_token_get.dart';
import 'package:ojakgyo/src/services/dealer_info_model.dart';

// InquiryLockerModal
class InquiryLockerModal extends StatefulWidget {
  const InquiryLockerModal({super.key});

  @override
  State<InquiryLockerModal> createState() => _InquiryLockerModalState();
}

class _InquiryLockerModalState extends State<InquiryLockerModal> {
  TextEditingController lockerSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
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
                          height: 15,
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
                        Material(
                          child: SearchBox(
                            controller: lockerSearchController,
                            hintText: "락커 아이디를 입력하세요.",
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(23),
                  child: Column(
                    children: [
                      LockerList(
                        lockerID: 1,
                        lockerAddress: '부산시 남구 용소로 45',
                      ),
                      LockerList(
                        lockerID: 1,
                        lockerAddress: '부산시 남구 용소로 45',
                      ),
                      LockerList(
                        lockerID: 1,
                        lockerAddress: '부산시 남구 용소로 45',
                      ),
                      LockerList(
                        lockerID: 1,
                        lockerAddress: '부산시 남구 용소로 45',
                      ),
                      LockerList(
                        lockerID: 1,
                        lockerAddress: '부산시 남구 용소로 45',
                      ),
                      LockerList(
                        lockerID: 1,
                        lockerAddress: '부산시 남구 용소로 45',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
