import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// 움직이는 status bar를 위해 사용
class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  //Animate

  AnimationController _animationController;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    //start animation
    _animationController.forward();

    super.onInit();
  }
}
