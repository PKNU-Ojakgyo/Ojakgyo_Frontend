import 'package:flutter/material.dart';

class CounterPartyList extends StatefulWidget {
  const CounterPartyList({
    Key? key,
    required this.counterPartyID,
    required this.counterPartyName,
    required this.counterPartyPhone,
  }) : super(key: key);

  final String counterPartyID;
  final String counterPartyName;
  final String counterPartyPhone;

  @override
  State<CounterPartyList> createState() => _AppState();
}

class _AppState extends State<CounterPartyList> {
  bool isToggled = false;
  late String modifiedPhone = '';

  @override
  void initState() {
    super.initState();
    String copyCounterPartyPhone = widget.counterPartyPhone;
    String replacedPart = '****';
    modifiedPhone = copyCounterPartyPhone.replaceRange(4, 8, replacedPart);
    print("phone number : $modifiedPhone");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD8E8E9),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Material(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isToggled = !isToggled;
                              });
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFD8E8E9),
                              ),
                              child: isToggled
                                  ? const Icon(
                                      Icons.arrow_drop_up,
                                      size: 40,
                                      color: Color(0xFF4A6C88),
                                    )
                                  : const Icon(
                                      Icons.arrow_drop_down,
                                      size: 40,
                                      color: Color(0xFF4A6C88),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.counterPartyName,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(221, 21, 21, 21),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.email,
                              color: Color.fromARGB(221, 53, 53, 53),
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.counterPartyID,
                              style: const TextStyle(
                                color: Color.fromARGB(221, 21, 21, 21),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Color.fromARGB(221, 53, 53, 53),
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              modifiedPhone,
                              style: const TextStyle(
                                color: Color.fromARGB(221, 21, 21, 21),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Visibility(
                  visible: isToggled,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text("거래 상태 : "),
                                  Text(
                                    "거래 완료",
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: const [
                                  Text("거래 일시 : "),
                                  Text("2023.08.16 01:29"),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: const [
                                  Text("거래 물품 : "),
                                  Text("고등어 인형"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
