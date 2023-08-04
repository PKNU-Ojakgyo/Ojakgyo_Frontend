import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/list_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
    required this.userName,
  }) : super(key: key);

  final String userName;

  @override
  State<MainPage> createState() => _AppState();
}

class _AppState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF23225C),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                decoration:
                    const BoxDecoration(color: Colors.white), //Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 23,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 80,
                        width: 170,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFD8E8E9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(26),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/profile1_img.png',
                                height: 140,
                                width: 140,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                '환영합니다!',
                                style: TextStyle(
                                  color: Color.fromARGB(221, 21, 21, 21),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.userName,
                                    style: const TextStyle(
                                      color: Color.fromARGB(221, 21, 21, 21),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Text(
                                    '님',
                                    style: TextStyle(
                                      color: Color.fromARGB(221, 21, 21, 21),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 23,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ListCard(
                      tranState: '거래완료',
                      tranDate: '2023.08.03 14:10',
                      tranPerson: '후추동생',
                      tranItem: '그리니즈',
                      tranPrice: '4,000원',
                    ),
                    const ListCard(
                      tranState: '거래중',
                      tranDate: '2023.08.03 14:10',
                      tranPerson: '윤여울',
                      tranItem: '램',
                      tranPrice: '30,000원',
                    ),
                    const ListCard(
                      tranState: '거래중',
                      tranDate: '2023.08.04 16:11',
                      tranPerson: '유정권',
                      tranItem: '맥북',
                      tranPrice: '1,500,000원',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}