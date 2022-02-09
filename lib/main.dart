import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopshoe/screens/main_screen.dart';
import 'package:shopshoe/screens/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //xóa banner
      debugShowCheckedModeBanner: false,
      title: 'Shoe Store APP',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Lato'
      ),
      //route điều hướng đi muôn nơi
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        OnBoardingScreen.id: (context) => const OnBoardingScreen(),
        MainScreen.id: (context) => const MainScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final store = GetStorage();
  @override
  //treo logo 3s rồi nhảy vào mainscreen
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        //check user rồi mới chuyển on boarding hoặc ko chuyển
        bool? _boarding = store.read('onBoarding');
        _boarding == null ? Navigator.pushReplacementNamed(context, OnBoardingScreen.id):
        _boarding == true ? Navigator.pushReplacementNamed(context, MainScreen.id):
        //nếu sai
        Navigator.pushReplacementNamed(context, OnBoardingScreen.id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logo2.png'),
      ),
    );
  }
}


