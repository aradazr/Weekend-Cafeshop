import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weekend_cafeshop/di/2di.dart';
import 'package:weekend_cafeshop/screens/check_device_screen.dart';
import 'package:weekend_cafeshop/screens/splash_screen.dart';
import 'package:weekend_cafeshop/utils/extension/orientation_lock%20.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // فقط حالت عمودی رو به بالا
    DeviceOrientation.portraitDown, // حالت عمودی رو به پایین
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekend Cafe Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: CheckDeviceWeb(
        mobileView: OrientationLock(
          child: SplashScreen(),
        ),
      ), // تغییر مسیر به صفحه اسپلش
    );
  }
}
