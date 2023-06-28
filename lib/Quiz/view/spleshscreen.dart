import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xe7000000),
          ),
          child: Container(
            height: 250,
            width: 250,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
