import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../model/emodel.dart';
import '../provider/eprovider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  EProvider? providerF;
  EProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<EProvider>(context, listen: true);
    providerF = Provider.of<EProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                CupertinoIcons.search,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                CupertinoIcons.square_favorites,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ],
          title: Text("Quiz App",
              style: GoogleFonts.playfairDisplay(color: Colors.white)),
          centerTitle: true,
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              EModel? e1 = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          "${e1!.results![providerT!.qindex].question}",
                          style: GoogleFonts.playfairDisplay(
                              color: Colors.white, fontSize: 24),
                        )),
                      ),
                      height: 30.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black),
                    ),
                    Spacer(),
                    SizedBox(height: 40),
//*******************************************************************************************\\
                    InkWell(
                      onTap: () {
                        providerF!.next();
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                "A.${e1!.results![providerT!.qindex].correctAnswer}",
                                style: GoogleFonts.playfairDisplay(
                                    color: Colors.white, fontSize: 22),
                              )),
                        ),
                        height: 5.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        providerF!.next();
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                "B.${e1!.results![providerT!.qindex].incorrectAnswers![providerT!.randomIndex1 as int]}",
                                style: GoogleFonts.playfairDisplay(
                                    color: Colors.white, fontSize: 22),
                              )),
                        ),
                        height: 5.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        providerF!.next();
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                "C.${e1!.results![providerT!.qindex].incorrectAnswers![providerT!.randomIndex2 as int]}",
                                style: GoogleFonts.playfairDisplay(
                                    color: Colors.white, fontSize: 22),
                              )),
                        ),
                        height: 5.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell (
                      onTap: () {
                        providerF!.next();
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                "D.${e1!.results![providerT!.qindex].incorrectAnswers![providerT!.randomIndex3 as int]}",
                                style: GoogleFonts.playfairDisplay(
                                    color: Colors.white, fontSize: 22),
                              )),
                        ),
                        height: 5.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black),
                      ),
                    ),
//*******************************************************************************************\\
                    Spacer(),
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                              "Skip",
                              style: GoogleFonts.playfairDisplay(
                                  color: Colors.white, fontSize: 22),
                            )),
                      ),
                      height: 5.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black),
                    ),
                      InkWell(
                        onTap: () => providerF!.next(),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                                  "Next",
                                  style: GoogleFonts.playfairDisplay(
                                      color: Colors.white, fontSize: 22),
                                )),
                          ),
                          height: 5.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.black),
                        ),
                      ),
                    ],),
                    SizedBox(height: 20),
                  ],
                ),
              );
            }
            return Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          },
          future: providerT!.getData(),
        ),
      ),
    );
  }
}
