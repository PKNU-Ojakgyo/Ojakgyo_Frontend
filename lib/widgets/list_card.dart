import 'package:flutter/material.dart';
import 'package:ojakgyo/src/pages/tran_detail_page.dart';
import 'package:ojakgyo/src/services/user_data.dart';

class ListCard extends StatefulWidget {
  const ListCard({
    Key? key,
    required this.user,
    required this.tranState, // 거래 상태
    required this.tranDate, // 거래 날짜
    required this.tranPerson, // 거래 대상
    required this.tranItem, // 거래 품목
    required this.tranPrice, // 거래 가격
  }) : super(key: key);

  final User user;
  final String tranState;
  final String tranDate;
  final String tranPerson;
  final String tranItem;
  final String tranPrice;

  @override
  State<ListCard> createState() => _AppState();
}

class _AppState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TranDetailPage(user: widget.user),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFD8E8E9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(26),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.tranDate,
                        style: const TextStyle(
                          color: Color.fromARGB(221, 53, 53, 53),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 12,
                            color: widget.tranState == '거래중'
                                ? const Color(0xFFE46F2A)
                                : const Color(0xFF00ADC2),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.tranState,
                            style: const TextStyle(
                              color: Color.fromARGB(221, 53, 53, 53),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.tranItem,
                        style: const TextStyle(
                          color: Color.fromARGB(221, 21, 21, 21),
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Color.fromARGB(221, 53, 53, 53),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            widget.tranPerson,
                            style: const TextStyle(
                              color: Color.fromARGB(221, 53, 53, 53),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money,
                            color: Color.fromARGB(221, 53, 53, 53),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            widget.tranPrice,
                            style: const TextStyle(
                              color: Color.fromARGB(221, 53, 53, 53),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
