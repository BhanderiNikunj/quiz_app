import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Quiz/model/quiz_model.dart';
import 'package:quiz_app/Quiz/provider/quiz_provider.dart';
import 'package:quiz_app/utils/api_helper.dart';
import 'package:sizer/sizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Quizprovider? qf;
  Quizprovider? qt;

  @override
  Widget build(BuildContext context) {
    Provider.of<Quizprovider>(context, listen: false);
    Provider.of<Quizprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: Helper.helper.quiz_Api(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              QuizModel quiz = snapshot.data!;
              return Container(
                height: 100.h,
                width: 100.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Question ${qt!.i}/${quiz.results.length}",
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 100.w,
                        height: 78.h,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${quiz.results[qt!.i].question}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20),
                            qt!.randomlist.length == 0
                                ? InkWell(
                                    onTap: () {
                                      qf!.random_Option(
                                        quiz.results[qt!.i].incorrectAnswers,
                                        quiz.results[qt!.i].correctAnswer,
                                      );
                                    },
                                    child: Container(
                                      width: 50.w,
                                      height: 7.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        "Show answer",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: qt!.randomlist
                                        .map(
                                          (e) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                            ),
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                width: 50.w,
                                                height: 7.h,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Text(
                                                  "$e",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
