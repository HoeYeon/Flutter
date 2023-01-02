import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // flutter show the back button automatically? meaning?
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Skip",
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.white)),
          )
        ],
      ),
      body: Body(),
    );
  }
}
