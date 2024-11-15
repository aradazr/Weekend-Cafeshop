import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:weekend_cafeshop/bloc/category/category_bloc.dart';
import 'package:weekend_cafeshop/constans/my_color.dart';
import 'package:weekend_cafeshop/screens/home_screen.dart'; // یا screens/category_screen.dart بسته به نیاز

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  void checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      // اگر اینترنت قطع باشد
      _showNoInternetDialog();
    } else {
      // اگر اینترنت وصل باشد، به صفحه کتگوری منتقل شود
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => CategoryBloc(),
              child: HomeScreen(), // یا CategoryScreen
            ),
          ),
        );
      });
    }
  }

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('No Internet'),
        content: const Text('Please check your internet connection and try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              checkConnection(); // دوباره بررسی اتصال به اینترنت
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Image.asset('assets/images/WeekendLogo.png',height: 200,),
            SpinKitThreeBounce(
              color: MyColors.titleColor,
              size: 30.0,
            ),
            SizedBox(height: 16),
            
          ],
        ),
      ),
    );
  }
}
