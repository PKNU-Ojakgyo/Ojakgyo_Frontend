import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ojakgyo/widgets/counterparty_list.dart';
import 'package:ojakgyo/widgets/search_box.dart';

import 'package:ojakgyo/src/services/auth_token_get.dart';

import 'package:ojakgyo/src/services/dealer_info_model.dart';

class InquiryCounterPartyModal extends StatefulWidget {
  const InquiryCounterPartyModal({super.key});

  @override
  State<InquiryCounterPartyModal> createState() =>
      _InquiryCounterPartyModalState();
}

class _InquiryCounterPartyModalState extends State<InquiryCounterPartyModal> {
  TextEditingController counterPartyController = TextEditingController();
  DealerInfoModel dealerInfo = DealerInfoModel();

  Future<void> search(String dealerEmail) async {
    AuthTokenGet authToken = AuthTokenGet();
    try {
      http.Response response = await authToken
          .authTokenCallBack('deal/search-dealer?dealerEmail=$dealerEmail');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        dealerInfo = DealerInfoModel.fromJson(responseData);
      } else {
        throw Exception('데이터를 불러오지 못했습니다.');
      }
    } catch (e) {
      throw Exception(e);
    }
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
                          "거래 대상자 조회하기",
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
                            controller: counterPartyController,
                            hintText: '예시) 홍길동',
                            onPressed: () async {},
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
                      CounterPartyList(
                        counterPartyID: 'rnjsdbwjd@naver.com',
                        counterPartyName: '권유정',
                        counterPartyPhone: '010-9876-5432',
                      )
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
