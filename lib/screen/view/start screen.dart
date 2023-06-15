import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class startScreen extends StatefulWidget {
  const startScreen({super.key});

  @override
  State<startScreen> createState() => _startScreenState();
}

class _startScreenState extends State<startScreen> {
  @override
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(height: 100.h,width: 100.w,child: Stack(
          children: [
            Image.asset("assets/images/bg.png",fit: BoxFit.fill,),
        Align(alignment: Alignment.center,child: InkWell(
          onTap: () => Navigator.pushNamed(context, 'home'),
          child: Container(
            height: 70,
            width: 100,
            child: Center(child: Text("Start",style: GoogleFonts.play(fontSize: 25,color: Colors.white))),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
            color: Colors.blue.shade900),
          ),
        )),
          ],
        ),),
      ),
    );
  }
}
