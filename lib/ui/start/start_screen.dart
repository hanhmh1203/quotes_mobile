import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quotes_mobile/ui/left_menu/left_menu_page.dart';

import '../../core/colors_type.dart';
import '../view_item/view_item_page.dart';
import 'start_page.dart';

class StartScreen extends GetView<StartController> {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // controller.parseJson();
    return Scaffold(
        appBar: AppBar(
          title:
              Obx(() => Text('${controller.title.value.toUpperCase()}').tr()),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                await controller.loadDataQuote();

                // Add your refresh logic here
              },
            ),
          ],
        ),
        drawer: LeftMenuScreen(), // Sử dụng CustomDrawer
        body: Column(
          children: [
            Expanded(
              // Wrap ListView.builder with Expanded to avoid layout issues
              child: Obx(
                () {
                  return ListView.builder(
                    itemCount: controller.quotes.length,
                    // Number of items in the list
                    itemBuilder: (context, index) {
                      // Get color in order from the colors list
                      final color = colors[index % colors.length];
                      return QuoteItemWidget(
                        key: ValueKey(controller.quotes[index].getKey()),
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
