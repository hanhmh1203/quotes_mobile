import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'setting_page.dart';

class SettingScreen extends GetView<SettingController>{
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(
        child: Text(
          'Screen Settings',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

}