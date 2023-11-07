import 'package:flutter/material.dart';
import 'package:ojakgyo/src/pages/my_page.dart';
import 'package:ojakgyo/widgets/list_card.dart';
import 'package:ojakgyo/src/pages/register_tran_page.dart';
import 'package:ojakgyo/src/services/auth_token_get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ojakgyo/src/services/user_info_model.dart';
import 'package:ojakgyo/src/pages/tran_detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _AppState();
}

class _AppState extends State<MainPage> {
  late Map<String, dynamic> responseData;
  UserInfoModel userInfo = UserInfoModel.fromJson({});

  Future<void> sendToken() async {
    AuthTokenGet authToken = AuthTokenGet();
    try {
      http.Response response = await authToken.authTokenCallBack('user/main');
      print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData =
            jsonDecode(utf8.decode(response.bodyBytes));
        setState(() {
          userInfo = UserInfoModel.fromJson(responseData);
        });
        print(userInfo);
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
    List<UserDealLists>? dealLists = userInfo.userDealLists;
    print('dealLists : $dealLists');

    Map<String, dynamic> dealState = {
      'BEFORE': '거래 전',
      'DEALING': '거래 중',
      'COMPLETED': '거래 완료',
      'CANCELED': '거래 취소',
    };

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
                      InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyPage()),
                          )
                        },
                        child: Container(
                          // 프로필 창
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
                                      userInfo.user?.name ?? 'Unknown',
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
                    InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterTranPage(
                                    userInfo: userInfo,
                                  )),
                        ),
                      },
                      child: Container(
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    dealLists != null && dealLists.isNotEmpty
                        ? Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: dealLists.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final items = dealLists[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TranDetailPage(
                                            dealId: items.dealId,
                                            userInfo: userInfo,
                                          ),
                                        ),
                                      );
                                    },
                                    child: ListCard(
                                      tranState: dealState[items.dealStatus],
                                      tranDate: items.createAt,
                                      tranItem: items.item,
                                      tranPrice: items.price.toString(),
                                      seller: items.sellerName,
                                      buyer: items.buyerName,
                                      dealId: items.dealId,
                                    ),
                                  );
                                },
                              ),
                            ],
                          )
                        : const Column(
                            children: [
                              Text(
                                '등록된 거래 정보가 없습니다.',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
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
