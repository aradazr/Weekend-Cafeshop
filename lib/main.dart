import 'package:flutter/material.dart';
import 'package:weekend_cafeshop/di/2di.dart';
import 'package:weekend_cafeshop/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekend Cafe Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        useMaterial3: true,
      ),
      home: HomeScreen()
    );
  }
}


