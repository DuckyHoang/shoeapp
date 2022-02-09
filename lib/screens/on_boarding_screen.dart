// import 'dart:html';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopshoe/screens/main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const String id = 'onboard-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //cuộn 5 hình mở đầu
  double scrollerPosition = 0;

  final store = GetStorage();

  //dùng chung tính năng click nhảy vào home (xem bên file main)
  onButtonPressed(context) {
    store.write('onBoarding', true);
    return Navigator.pushReplacementNamed(context, MainScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 221, 139, 114),
        body: Stack(
      children: [
        PageView(
          onPageChanged: (val) {
            setState(() {
              scrollerPosition = val.toDouble();
            });
          },
          children: [
            OnBoardPage(
              bordColumn: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Chào mừng\n đến với cửa hàng',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '+10 nghìn sản phẩm\n+100 danh mục\n+20 Brands ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/images/2.png')),
                ],
              ),
            ),
            OnBoardPage(
              bordColumn: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '7-14 Ngày Đổi Trả',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'An toàn Khi Mua Sắm',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/images/3.png')),
                ],
              ),
            ),
            OnBoardPage(
              bordColumn: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Tìm Kiếm Sản Phẩm\n Bạn Ưa Thích',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/images/4.png')),
                ],
              ),
            ),
            OnBoardPage(
              bordColumn: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Mua sắm thông minh',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/images/5.png')),
                ],
              ),
            ),
            OnBoardPage(
              bordColumn: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'An Toàn & Bảo Mật\n Thanh Toán',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/images/1.png')),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DotsIndicator(
                dotsCount: 5,
                position: scrollerPosition,
                decorator: const DotsDecorator(
                  activeColor: Colors.white,
                ),
              ),
              scrollerPosition == 4
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepOrange)),
                        child: const Text(
                          'BẮT ĐẦU MUA SẮM',
                          
                        ),
                        //click chuyển trang home
                        onPressed: () {
                          onButtonPressed(context);
                        },
                      ),
                    )
                  : TextButton(
                      child: const Text(
                        "BỎ QUA >>",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      //click chuyển trang home
                      onPressed: () {
                        onButtonPressed(context);
                      },
                    ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class OnBoardPage extends StatelessWidget {
  final Column? bordColumn;
  const OnBoardPage({Key? key, this.bordColumn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.deepOrange,
          child: Center(child: bordColumn),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 63, 94, 109),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                )),
          ),
        ),
      ],
    );
  }
}
