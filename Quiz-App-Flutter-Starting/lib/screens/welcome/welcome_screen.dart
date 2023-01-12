import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      WebsafeSvg.asset("assets/icon/bg.svg"),
      SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 2), // 2/6
            Text("Lets Play Quiz,",
                style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text("Enter your informations below"),
            Spacer(), // 1/6
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF1C2341),
                hintText: "Full Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(12),
                )),
              ),
            ),
            Spacer(), // 1/6
            InkWell(
              onTap: () => Get.to(QuizScreen()),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.all(kDefaultPadding * 0.75),
                decoration: BoxDecoration(
                  gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Text(
                  "Lets Start Quiz",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.black),
                ),
              ),
            ),
            Spacer(flex: 2), // 전체 정의된 flex(6개 기본이 1) 2개 만큼의 비중을 가져감 즉, 2/6
          ],
        ),
      ))
    ]));
  }
}
