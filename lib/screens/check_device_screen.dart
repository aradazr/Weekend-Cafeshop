import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:universal_html/html.dart' as html;
import 'package:weekend_cafeshop/constans/my_color.dart';

class CheckDeviceWeb extends StatelessWidget {
  final Widget mobileView; // صفحه‌ای که برای موبایل نمایش داده می‌شود

  const CheckDeviceWeb({super.key, required this.mobileView});

  @override
  Widget build(BuildContext context) {
    // بررسی اندازه صفحه
    final isSmallScreen = MediaQuery.of(context).size.width < 415;

    // دریافت User-Agent
    final userAgent = html.window.navigator.userAgent.toLowerCase();

    // بررسی User-Agent (تکمیلی)
    final isMobileUserAgent = userAgent.contains("mobile") ||
        userAgent.contains("android") ||
        userAgent.contains("iphone") ||
        userAgent.contains("ipad");

    // ترکیب MediaQuery و User-Agent
    final isMobile = isSmallScreen || isMobileUserAgent;

    return isMobile
        ? mobileView
        :
        
        Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/WeekendLogo.png',
                    height: 200,
                  ),
                  const SizedBox(height: 16),
                  const SpinKitThreeBounce(
                    color: MyColors.titleColor,
                    size: 30.0,
                  ),
                  const Text(
                    'لطفا سایت را با موبایل باز کنید',
                    style: TextStyle(
                        color: MyColors.titleColor,
                        fontFamily: 'shma',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
  }
}


