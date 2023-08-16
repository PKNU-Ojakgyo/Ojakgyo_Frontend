import 'package:flutter/material.dart';
import 'package:ojakgyo/widgets/back_navbar.dart';
import 'package:ojakgyo/widgets/main_title.dart';
import 'package:ojakgyo/widgets/line.dart';
import 'package:ojakgyo/widgets/sub_title.dart';
import 'package:ojakgyo/widgets/inquiry_btn.dart';
import 'package:ojakgyo/widgets/text_input.dart';
import 'package:ojakgyo/widgets/register_btn.dart';
import 'package:ojakgyo/src/services/user_data.dart';
import 'package:ojakgyo/widgets/inquiry_locker_modal.dart';
import 'package:ojakgyo/widgets/inquiry_counterparty_modal.dart';
import 'package:ojakgyo/widgets/custom_alert_dialog.dart';
import 'package:ojakgyo/src/pages/main_page.dart';

class RegisterTranPage extends StatefulWidget {
  const RegisterTranPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<RegisterTranPage> createState() => _AppState();
}

class _AppState extends State<RegisterTranPage> {
  // 판매자 구매자 체크박스 활성화 state 변수
  bool? isSeller = false;
  bool? isBuyer = false;

  // 거래 계좌 은행 선택 list
  final List<String> banks = [
    '카카오뱅크',
    '국민은행',
    '기업은행',
    '농협은행',
    '신한은행',
    '우리은행',
    '하나은행',
    '부산은행'
  ];

  // 선택한 거래 계좌 은행
  String? accountBankController = '카카오뱅크';

  // 각 textField에서 입력 받은 값을 저장할 변수
  late TextEditingController lockerIDController; // default
  late TextEditingController lockerAddressController; // default
  late TextEditingController nameController; // default : userInfo
  late TextEditingController cellPhoneController; // default : userInfo
  late TextEditingController accountController;
  late TextEditingController priceController;
  late TextEditingController itemPriceController;
  late TextEditingController itemNameController;
  late TextEditingController itemConditionController;
  late TextEditingController buyerNameController; // default
  late TextEditingController buyerCellPhoneController; // default

  void submitTranInfo() {
    print("locker_id : ${lockerIDController.text}"); // default
    print("locker_address : ${lockerAddressController.text}"); // default
    print("name : ${nameController.text}"); // default
    print("cellphone : ${cellPhoneController.text}"); // default
    print("isSeller : $isSeller");
    print("isbuyer : $isBuyer");
    print("account : ${accountController.text}"); // 숫자로 입력받기
    print("account_bank : $accountBankController");
    print("price : ${itemPriceController.text}"); // 숫자로 입력받기
    print("item : ${itemNameController.text}");
    print("condition : ${itemConditionController.text}");
    print("buyer_name : ${buyerNameController.text}"); // default
    print("buyer_cellphone : ${buyerCellPhoneController.text}"); // default
  }

  bool isNullTextField(
      String lockerID,
      String lockerAddress,
      String name,
      String cellPhone,
      String account,
      String itemPrice,
      String itemName,
      String itemCondition,
      String buyerName,
      String buyerCellPhone) {
    if (lockerID.isEmpty ||
        lockerAddress.isEmpty ||
        name.isEmpty ||
        cellPhone.isEmpty ||
        account.isEmpty ||
        itemPrice.isEmpty ||
        itemName.isEmpty ||
        itemCondition.isEmpty ||
        buyerName.isEmpty ||
        buyerCellPhone.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool isNullCheckbox(bool? isSeller, bool? isBuyer) {
    if ((isSeller == null && isBuyer == null) || (!isSeller! && !isBuyer!)) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    lockerIDController = TextEditingController();
    lockerAddressController = TextEditingController();
    nameController = TextEditingController(text: widget.user.name);
    cellPhoneController = TextEditingController(text: widget.user.phone);
    accountController = TextEditingController();
    itemPriceController = TextEditingController();
    itemNameController = TextEditingController();
    itemConditionController = TextEditingController();
    buyerNameController = TextEditingController();
    buyerCellPhoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackNavBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            children: [
              const MainTitle(mainTitle: '거래 등록'),
              const Line(),
              const SubTitle(subTitle: '락커 정보 입력'),
              TextInput(
                textType: '락커 ID',
                hintText: '거래를 진행할 락커의 ID를 입력하세요.',
                isDefault: true,
                controller: lockerIDController,
              ),
              TextInput(
                textType: '락커 주소',
                hintText: '거래를 진행할 락커의 주소를 입력하세요.',
                isDefault: true,
                controller: lockerAddressController,
              ),
              const InquiryBtn(
                btnName: '락커 조회하기',
                returnWidget: InquiryLockerModal(),
              ),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 등록자 정보 입력'),
              TextInput(
                textType: '거래 등록자 이름',
                hintText: '거래 등록자의 이름을 입력하세요.',
                isDefault: true,
                controller: nameController,
              ),
              TextInput(
                textType: '거래 등록자 전화번호',
                hintText: '거래 등록자의 전화번호를 입력하세요.',
                isDefault: true,
                controller: cellPhoneController,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 24.0,
                    child: Checkbox(
                      value: isSeller,
                      onChanged: (value) {
                        setState(
                          () {
                            isSeller = value;
                            if (isBuyer ?? true) {
                              setState(
                                () {
                                  isBuyer = false;
                                },
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const Text('판매자'),
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    width: 24.0,
                    child: Checkbox(
                      value: isBuyer,
                      onChanged: (value) {
                        setState(
                          () {
                            isBuyer = value;
                            if (isSeller ?? true) {
                              setState(
                                () {
                                  isSeller = false;
                                },
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const Text('구매자'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 정보 입력'),
              Row(
                children: [
                  DropdownButton(
                    value: accountBankController,
                    items: banks.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        accountBankController = value;
                      });
                    },
                  ),
                ],
              ),
              TextInput(
                textType: '거래 계좌',
                hintText: '거래를 진행할 계좌 번호를 입력하세요.',
                isDefault: false,
                controller: accountController,
                textInputType: TextInputType.number,
              ),
              TextInput(
                textType: '거래 금액',
                hintText: '거래할 물품의 금액을 입력하세요.',
                isDefault: false,
                controller: itemPriceController,
                textInputType: TextInputType.number,
              ),
              TextInput(
                textType: '거래 물품',
                hintText: '거래할 물품의 상품명을 입력하세요.',
                isDefault: false,
                controller: itemNameController,
              ),
              TextInput(
                textType: '물품 상태',
                hintText: '거래할 물품의 상태를 간단하게 기재하세요.',
                isDefault: false,
                controller: itemConditionController,
              ),
              const SizedBox(
                height: 10,
              ),
              const SubTitle(subTitle: '거래 대상자 정보 입력'),
              TextInput(
                textType: '거래 대상자 이름',
                hintText: '거래 대상자의 이름을 입력하세요.',
                isDefault: true,
                controller: buyerNameController,
              ),
              TextInput(
                textType: '거래 대상자 전화번호',
                hintText: '거래 대상자의 전화번호를 입력하세요.',
                isDefault: true,
                controller: buyerCellPhoneController,
              ),
              const InquiryBtn(
                btnName: '거래 대상자 조회',
                returnWidget: InquiryCounterPartyModal(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RegisterBtn(
                    btnName: '등록하기',
                    isModal: false,
                    onPressed: () {
                      if (isNullCheckbox(isSeller, isBuyer) &&
                          isNullTextField(
                            lockerIDController.text,
                            lockerAddressController.text,
                            nameController.text,
                            cellPhoneController.text,
                            accountController.text,
                            itemPriceController.text,
                            itemNameController.text,
                            itemConditionController.text,
                            buyerNameController.text,
                            buyerCellPhoneController.text,
                          )) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlertDialog(
                              title: const Text('알림'),
                              content: const Text('거래를 등록하시겠습니까?'),
                              actions: [
                                RegisterBtn(
                                  btnName: '확인',
                                  onPressed: () {
                                    submitTranInfo();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MainPage(user: widget.user),
                                      ),
                                    );
                                  },
                                  isModal: true,
                                ),
                                RegisterBtn(
                                  btnName: '취소',
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  isModal: true,
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlertDialog(
                              title: const Text('경고'),
                              content: const Text('입력하지 않은 값이 존재합니다.'),
                              actions: [
                                RegisterBtn(
                                  btnName: '확인',
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  isModal: true,
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 70,
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
