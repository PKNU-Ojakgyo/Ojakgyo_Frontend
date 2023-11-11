import 'package:flutter/material.dart';
import 'package:ojakgyo/src/services/dealer_info_model.dart';
import 'package:ojakgyo/widgets/choose_btn.dart';

class CounterPartyList extends StatefulWidget {
  const CounterPartyList({
    Key? key,
    required this.dealerID,
    required this.counterPartyID,
    required this.counterPartyName,
    required this.counterPartyPhone,
    required this.dealLists,
    required this.buyerNameController,
    required this.buyerCellPhoneController,
    required this.callback,
  }) : super(key: key);

  final int dealerID;
  final String counterPartyID;
  final String counterPartyName;
  final String counterPartyPhone;
  final List<DealLists> dealLists;
  final TextEditingController buyerNameController;
  final TextEditingController buyerCellPhoneController;
  final Function(int) callback;

  @override
  State<CounterPartyList> createState() => _AppState();
}

class _AppState extends State<CounterPartyList> {
  bool isToggled = true;
  late String modifiedPhone = '';

  Map<String, dynamic> dealState = {
      'BEFORE': '거래 전',
      'DEALING': '거래 중',
      'COMPLETED': '거래 완료',
      'CANCELED': '거래 취소',
    };

  @override
  void initState() {
    super.initState();
    String copyCounterPartyPhone = widget.counterPartyPhone;
    String replacedPart = '****';
    modifiedPhone = copyCounterPartyPhone.replaceRange(3, 7, replacedPart);
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
                              Icons.phone_android,
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
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                Visibility(
                  visible: isToggled,
                  child: SizedBox(
                    height: 300,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: widget.dealLists.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final items = widget.dealLists[index];
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  const Text("거래 상태 : "),
                                                  Text(
                                                    dealState[items.dealStatus] ??
                                                        'Unknown',
                                                    style: const TextStyle(
                                                        color:
                                                            Colors.redAccent),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                children: [
                                                  const Text("거래 일시 : "),
                                                  Text(items.updateAt ??
                                                      'Unknown'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                children: [
                                                  const Text("거래 물품 : "),
                                                  Text(items.item ?? 'Unknown'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ChooseBtn(
                      title: '선택',
                      onPressed: () {
                        widget.callback(widget.dealerID);
                        widget.buyerNameController.text =
                            widget.counterPartyName.toString();
                        widget.buyerCellPhoneController.text =
                            widget.counterPartyPhone.toString();
                        // 이제 Navigator.pop를 widget.callback 이후에 호출합니다.
                        Navigator.pop(context);
                      },
                    ),
                  ],
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
