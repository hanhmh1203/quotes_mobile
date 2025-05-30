import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quotes_mobile/ui/left_menu/left_menu_page.dart';

import 'start_page.dart';

class StartScreen extends GetView<StartController> {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    controller.parseJson();
    return Scaffold(
      appBar: AppBar(
        title: const Text('StartScreen'),
      ),
      drawer: const LeftMenuScreen(), // Sử dụng CustomDrawer
      body: const Center(
        child: Text(
          'StartScreen',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
