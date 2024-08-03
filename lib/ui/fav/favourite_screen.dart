import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'favourite_page.dart';

class FavouriteScreen extends GetView<FavouriteController> {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(title: const Text('Favourites')),
      body: const Center(
        child: Text(
          'Screen Favourites',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
