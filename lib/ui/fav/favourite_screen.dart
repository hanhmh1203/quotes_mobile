import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../core/colors_type.dart';
import '../view_item/view_item_page.dart';
import 'favourite_page.dart';

class FavouriteScreen extends GetView<FavouriteController> {
  const FavouriteScreen({super.key});

  @override
  // TODO: implement controller
  FavouriteController get controller => Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('app_name').tr(),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                controller.loadDataQuote();
              },
              child: Text("click"),
            ),
            Expanded(
              // Wrap ListView.builder with Expanded to avoid layout issues
              child: Obx(
                () {
                  print(
                      "FavouriteScreen controller.quotes.length:${controller.quotes.length}");
                  return ListView.builder(
                    itemCount: controller.quotes.length,
                    // Number of items in the list
                    itemBuilder: (context, index) {
                      // Get color in order from the colors list
                      final color = colors[index % colors.length];
                      return QuoteItemWidget(
                        color: color,
                        itemVM: controller.quotes[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
