import 'package:a_exam_2/screen/provider/eprovider.dart';
import 'package:a_exam_2/screen/view/home%20screen.dart';
import 'package:a_exam_2/screen/view/start%20screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EProvider(),)
        ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => startScreen(),
            'home':(context) => homeScreen(),
          },
        ),
      ),
    ),
  );
}
