import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../core/colors_type.dart';
import '../view_item/view_item_page.dart';
import 'favourite_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  static String screenName = "FavouriteScreen";

  @override
  Widget build(BuildContext context) {
    // Use GetBuilder to manage the controller and update UI
    return Scaffold(
      appBar: AppBar(
        title: const Text('str_fav').tr(),
      ),
      body: Column(
        children: [
          Expanded(
            // Wrap ListView.builder with Expanded to avoid layout issues
            child: GetBuilder<FavouriteController>(
              init: FavouriteController(), // Initialize the controller
              builder: (controller) {
                print(
                    "FavouriteScreen controller.quotes.length:${controller.quotes.length}");
                return ListView.builder(
                  itemCount: controller.quotes.length,
                  // Number of items in the list
                  itemBuilder: (context, index) {
                    // Get color in order from the colors list
                    final color = colors[index % colors.length];
                    return QuoteItemWidget(
                      key: ValueKey('$screenName-${controller.quotes[index].getKey()}'),
                      screenName: screenName,
                      color: color,
                      itemVM: controller.quotes[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}