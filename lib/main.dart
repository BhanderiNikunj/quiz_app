import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Quiz/provider/quiz_provider.dart';
import 'package:quiz_app/Quiz/view/home_Screen.dart';
import 'package:quiz_app/Quiz/view/spleshscreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Quizprovider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => Splashscreen(),
            'home': (context) => Homescreen(),
          },
        ),
      ),
    ),
  );
}
