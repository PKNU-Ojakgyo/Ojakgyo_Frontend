import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ojakgyo/widgets/search_box.dart';
import 'package:ojakgyo/widgets/locker_list.dart';

import 'package:ojakgyo/src/services/auth_token_get.dart';

// InquiryLockerModal
class InquiryLockerModal extends StatefulWidget {
  const InquiryLockerModal({
    super.key,
    required this.lockerIdController,
    required this.lockerAddressController,
  });

  final TextEditingController lockerIdController;
  final TextEditingController lockerAddressController;

  @override
  State<InquiryLockerModal> createState() => _InquiryLockerModalState();
}

class _InquiryLockerModalState extends State<InquiryLockerModal> {
  late List<Map<String, dynamic>> responseData;
  List<Map<String, dynamic>> lockerData = [];

  TextEditingController lockerSearchController = TextEditingController();

  Future<void> sendToken() async {
    AuthTokenGet authToken = AuthTokenGet();
    try {
      http.Response response =
          await authToken.authTokenCallBack('deal/lockers');
      print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> responseData =
            List<Map<String, dynamic>>.from(
          json.decode(response.body) as List<dynamic>,
        );

        setState(() {
          lockerData = responseData;
        });
      } else {
        throw Exception('데이터를 불러오지 못했습니다.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> searchLocker() async {
    String address = lockerSearchController.text;
    AuthTokenGet authToken = AuthTokenGet();
    try {
      http.Response response = await authToken
          .authTokenCallBack('deal/search-locker-address?address=$address');
      print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> responseData =
            List<Map<String, dynamic>>.from(
          json.decode(response.body) as List<dynamic>,
        );

        setState(() {
          lockerData = responseData;
        });
      } else {
        throw Exception('데이터를 불러오지 못했습니다.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void initState() {
    super.initState();
    sendToken();
  }

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
                            onPressed: () {
                              searchLocker();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(23),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: lockerData.length,
                        itemBuilder: (BuildContext context, int index) {
                          final items = lockerData[index];
                          return LockerList(
                            lockerID: items['lockerId'],
                            lockerAddress: items['address'],
                            lockerIdController: widget.lockerIdController,
                            lockerAddressController:
                                widget.lockerAddressController,
                          );
                        },
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
