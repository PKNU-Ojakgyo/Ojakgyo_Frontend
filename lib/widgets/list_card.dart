import 'package:flutter/material.dart';

class ListCard extends StatefulWidget {
  const ListCard({
    Key? key,
    required this.tranState, // 거래 상태
    required this.tranDate, // 거래 날짜
    required this.tranItem, // 거래 품목
    required this.tranPrice, // 거래 가격
    required this.seller,
    required this.buyer,
    required this.dealId,
  }) : super(key: key);

  final String? tranState;
  final String? tranDate;
  final String? tranItem;
  final String? tranPrice;
  final String? seller;
  final String? buyer;
  final int? dealId;

  @override
  State<ListCard> createState() => _AppState();
}

class _AppState extends State<ListCard> {
  Map<String, Color> stateColor = {
    '거래 전': const Color.fromARGB(255, 0, 194, 84),
    '거래 중': const Color(0xFFE46F2A),
    '거래 완료': const Color(0xFF00ADC2),
    '거래 취소': const Color.fromARGB(255, 121, 121, 121),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                      widget.tranDate ?? 'Unknown',
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
                          color: stateColor[widget.tranState],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.tranState ?? 'Unknown',
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
                      widget.tranItem ?? 'Unknown',
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
                          widget.seller ?? 'Unknown',
                          style: const TextStyle(
                            color: Color.fromARGB(221, 53, 53, 53),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Icon(
                          Icons.arrow_forward_outlined,
                          color: Color.fromARGB(221, 53, 53, 53),
                          size: 15,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          widget.buyer ?? 'Unknown',
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
                          widget.tranPrice ?? 'Unknown',
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
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
