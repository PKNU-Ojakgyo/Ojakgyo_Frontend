import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/main_title.dart';
import 'package:ojakgyo/widgets/sub_title.dart';
import 'package:ojakgyo/widgets/line.dart';

class TranDetailView extends StatefulWidget {
  const TranDetailView({super.key});

  @override
  State<TranDetailView> createState() => _TranDetailViewState();
}

class _TranDetailViewState extends State<TranDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackNavBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            children: const [
              MainTitle(mainTitle: '거래 상세보기'),
              Line(),
              SubTitle(subTitle: '간이계약서'),
              // 간이계약서 조회 버튼
              SizedBox(
                height: 10,
              ),
              SubTitle(subTitle: '입금 현황'),
            ],
          ),
        ),
      ),
    );
  }
}
