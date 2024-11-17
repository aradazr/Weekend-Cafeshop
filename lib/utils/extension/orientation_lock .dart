import 'package:flutter/material.dart';

class OrientationLock extends StatelessWidget {
  final Widget child;

  const OrientationLock({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // گرفتن اطلاعات مربوط به ابعاد دستگاه
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    if (isLandscape) {
      return Scaffold(
        body: Center(
          child: Text(
            "لطفاً دستگاه را در حالت عمودی قرار دهید.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return child;
  }
}
