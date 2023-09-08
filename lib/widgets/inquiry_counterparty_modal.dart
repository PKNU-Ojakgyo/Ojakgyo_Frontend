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
  late Map<String, dynamic> responseData;
  DealerInfoModel dealerInfo = DealerInfoModel.fromJson({});

  TextEditingController counterPartyController = TextEditingController();
  bool isSearched = false;

  Future<void> searchDealer() async {
    String email = counterPartyController.text;
    AuthTokenGet authToken = AuthTokenGet();
    try {
      http.Response response = await authToken
          .authTokenCallBack('deal/search-dealer?dealerEmail=$email');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData =
            jsonDecode(utf8.decode(response.bodyBytes));

        setState(() {
          dealerInfo = DealerInfoModel.fromJson(responseData);
          isSearched = true;
        });

        print(responseData);
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
                            onPressed: () {
                              searchDealer();
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
                      isSearched
                          ? CounterPartyList(
                              counterPartyID: dealerInfo.email ?? 'Unknown',
                              counterPartyName: dealerInfo.name ?? 'Unknown',
                              counterPartyPhone: dealerInfo.phone ?? 'Unknown',
                              dealLists: dealerInfo.dealLists ?? [],
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
