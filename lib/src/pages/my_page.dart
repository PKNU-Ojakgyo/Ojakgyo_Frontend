import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/my_page_btn.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _AppState();
}

class _AppState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackNavBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD8E8E9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(26),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/profile1_img.png',
                      height: 90,
                      width: 90,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '윤현진',
                          style: TextStyle(
                            color: Color.fromARGB(221, 21, 21, 21),
                            fontSize: 23,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '010-1234-5678',
                          style: TextStyle(
                            color: Color.fromARGB(221, 53, 53, 53),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            for (var btnType in [
              '로그아웃',
              '회원 탈퇴',
              '내 정보 수정',
              '간이계약서 조회',
              '자주 묻는 질문',
              '비밀번호 변경'
            ])
              MyPageBtn(
                btnType: btnType,
              ),
            const SizedBox(
              height: 160,
            ),
            Container(
              height: 1.0,
              color: Colors.black87,
            ),
            const SizedBox(
              height: 24,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 70,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}