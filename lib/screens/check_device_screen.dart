// import 'package:flutter/material.dart';


// class CheckDeviceScreen extends StatefulWidget {
//   final Widget mobileView; // صفحه‌ای که باید برای موبایل نمایش داده شود

//   CheckDeviceScreen({required this.mobileView});

//   @override
//   _CheckDeviceScreenState createState() => _CheckDeviceScreenState();
// }

// class _CheckDeviceScreenState extends State<CheckDeviceScreen> {
//   bool? isMobile; // برای تعیین موبایل بودن یا نبودن

//   @override
//   void initState() {
//     super.initState();
//     _checkDeviceType();
//   }

//   // متد برای بررسی نوع دستگاه
//   Future<void> _checkDeviceType() async {
//     final deviceInfo = DeviceInfoPlugin();
//     try {
//       if (Theme.of(context).platform == TargetPlatform.android) {
//         final androidInfo = await deviceInfo.androidInfo;
//         setState(() {
//           // اگر دستگاه موبایل باشد
//           isMobile = androidInfo.isPhysicalDevice;
//         });
//       } else if (Theme.of(context).platform == TargetPlatform.iOS) {
//         final iosInfo = await deviceInfo.iosInfo;
//         setState(() {
//           // اگر دستگاه موبایل باشد
//           isMobile = iosInfo.isPhysicalDevice;
//         });
//       } else {
//         // اگر دستگاه موبایل نیست
//         setState(() {
//           isMobile = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         isMobile = false; // در صورت بروز خطا، فرض بر غیر موبایلی بودن دستگاه
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isMobile == null) {
//       return Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(), // لودینگ هنگام بررسی دستگاه
//         ),
//       );
//     }

//     return isMobile!
//         ? widget.mobileView // نمایش صفحه اصلی در صورت موبایل بودن
//         : Scaffold(
//             body: Center(
//               child: Text(
//                 "لطفا سایت را با موبایل باز کنید",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//           );
//   }
// }
