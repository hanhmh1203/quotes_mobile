import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'start_page.dart';

class StartScreen extends GetView<StartController> {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    controller.parseJson();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("StartScreen"),
            ),
            ElevatedButton(
              onPressed: () async {
                controller.loadDataAuthor();
              },
              child: Text('Insert and Load Quotes'),
            ),
          ],
        ),
      ),
    );
  }
}
